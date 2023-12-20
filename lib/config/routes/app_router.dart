import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/config/routes/routes.dart';
import 'package:grandeur/core/common/error.dart';
import 'package:grandeur/features/authentication/presentation/pages/forgot_password.dart';
import 'package:grandeur/features/authentication/presentation/pages/get_started_page.dart';
import 'package:grandeur/features/authentication/presentation/pages/login_page.dart';
import 'package:grandeur/features/authentication/presentation/pages/reset_password.dart';
import 'package:grandeur/features/authentication/presentation/pages/signup_page.dart';

class AppRouter {
  GoRouter defaultRouter = GoRouter(
    routes: [
      GoRoute(
        name: Routes.getStarted,
        path: '/',
        pageBuilder: (context, state) => const MaterialPage(
          child: GetStartedPage(),
        ),
      ),
      GoRoute(
        name: Routes.login,
        path: '/login',
        pageBuilder: (context, state) => const MaterialPage(
          child: LoginPage(),
        ),
      ),
      GoRoute(
        name: Routes.signup,
        path: '/signup',
        pageBuilder: (context, state) => const MaterialPage(
          child: SignUpPage(),
        ),
      ),
      GoRoute(
        name: Routes.forgotPassword,
        path: '/forgot-password',
        pageBuilder: (context, state) => const MaterialPage(
          child: ForgotPasswordPage(),
        ),
      ),
      GoRoute(
        name: Routes.resetPassword,
        path: '/reset-password',
        pageBuilder: (context, state) => const MaterialPage(
          child: ResetPasswordPage(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      child: ErrorPage(error: state.error.toString()),
    ),
  );
}
