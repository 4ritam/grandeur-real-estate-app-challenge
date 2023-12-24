import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grandeur/config/typedefs/typedefs.dart';
import 'package:grandeur/core/providers/authentication.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../data_sources/remote/auth_remote_api.dart';

final authRepositoryProvider = Provider<AuthRepository>(
  (ref) => AuthRepository(
      remote: ref.read(authRemoteApiProvider),
      authentication: ref.read(authenticationProvider.notifier)),
);

class AuthRepository {
  final AuthRemoteApi _authRemoteApi;
  final Authentication _authentication;
  const AuthRepository(
      {required AuthRemoteApi remote, required Authentication authentication})
      : _authRemoteApi = remote,
        _authentication = authentication;

  FutureEither<User> signup(String email, String password, String name) async {
    return await _authRemoteApi.signup(email, password, name);
  }

  FutureEither<Session> login(String email, String password) async {
    final response = await _authRemoteApi.login(email, password);
    return response.fold(
      (failure) {
        return Left(failure);
      },
      (user) {
        _authentication.toggle();
        return Right(user);
      },
    );
  }

  FutureEither<void> logout() async {
    final response = await _authRemoteApi.logout();
    return response.fold(
      (failure) {
        return Left(failure);
      },
      (user) {
        _authentication.toggle();
        return Right(user);
      },
    );
  }
}
