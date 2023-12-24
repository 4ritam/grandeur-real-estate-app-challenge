import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/config/routes/routes.dart';
import 'package:grandeur/core/utils/utils.dart';
import 'package:grandeur/features/authentication/data/repositories/auth_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, bool>(
  (ref) {
    return AuthController(authRepository: ref.watch(authRepositoryProvider));
  },
);

class AuthController extends StateNotifier<bool> {
  final AuthRepository _authRepository;
  AuthController({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(false);

  Future<void> signup(String email, String password, String confirmPassword,
      String name, BuildContext context) async {
    if (email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        name.isEmpty) {
      Snackbar.show(context, 'Please fill in all fields', ResultType.error);
      return;
    }

    state = true;

    final response = await _authRepository.signup(email, password, name);

    response.fold(
      (failure) {
        Snackbar.show(context, failure.message, ResultType.error);
      },
      (user) {
        Snackbar.show(
            context,
            'Welcome Aboard ${user.name}, Please Log in to Continue',
            ResultType.success);
        state = false;
        context.replaceNamed(Routes.login);
      },
    );

    state = false;
  }

  Future<void> login(
      String email, String password, BuildContext context) async {
    if (email.isEmpty || password.isEmpty) {
      Snackbar.show(context, 'Please fill in all fields', ResultType.error);
      return;
    }

    state = true;

    final response = await _authRepository.login(email, password);

    response.fold((failure) {
      Snackbar.show(context, failure.message, ResultType.error);
    }, (r) {
      Snackbar.show(context, 'Logged in successfully', ResultType.success);
      context.pop();
      context.replace(Routes.home);
    });
    state = false;
  }

  Future<void> logout(BuildContext context) async {
    state = true;

    final response = await _authRepository.logout();

    response.fold((failure) {
      Snackbar.show(context, failure.message, ResultType.error);
      state = false;
    }, (r) {
      Snackbar.show(context, 'Logged out successfully', ResultType.success);
      state = false;
      context.replace(Routes.getStarted);
    });
  }
}
