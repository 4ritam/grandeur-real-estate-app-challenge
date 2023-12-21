import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/config/routes/routes.dart';
import 'package:grandeur/core/common/error.dart';
import 'package:grandeur/features/authentication/presentation/pages/forgot_password.dart';
import 'package:grandeur/features/authentication/presentation/pages/get_started_page.dart';
import 'package:grandeur/features/authentication/presentation/pages/login_page.dart';
import 'package:grandeur/features/authentication/presentation/pages/reset_password.dart';
import 'package:grandeur/features/authentication/presentation/pages/signup_page.dart';
import 'package:grandeur/features/listings/presentation/pages/filter_page.dart';
import 'package:grandeur/features/tab_view/presentation/pages/view_template.dart';

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
      GoRoute(
        name: Routes.home,
        path: '/home',
        pageBuilder: (context, state) => const MaterialPage(
          child: ViewTemplate(
            index: 0,
          ),
        ),
        routes: [
          GoRoute(
            name: Routes.filterPage,
            path: 'filter-page',
            pageBuilder: (context, state) => const MaterialPage(
              child: FilterPage(),
            ),
          ),
          GoRoute(
            name: Routes.productDetail,
            path: 'product-detail/:id',
            pageBuilder: (context, state) => const MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text('Product Detail'),
                ),
              ),
            ),
          ),
        ],
      ),
      GoRoute(
        name: Routes.inboxPage,
        path: '/inbox',
        pageBuilder: (context, state) => const MaterialPage(
          child: ViewTemplate(
            index: 1,
          ),
        ),
      ),
      GoRoute(
        name: Routes.activityPage,
        path: '/activity',
        pageBuilder: (context, state) => const MaterialPage(
          child: ViewTemplate(
            index: 2,
          ),
        ),
      ),
      GoRoute(
        name: Routes.profilePage,
        path: '/profile',
        pageBuilder: (context, state) => const MaterialPage(
          child: ViewTemplate(
            index: 3,
          ),
        ),
        routes: [
          GoRoute(
            name: Routes.editProfilePage,
            path: 'edit',
            pageBuilder: (context, state) => const MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text('Edit Profile'),
                ),
              ),
            ),
          ),
          GoRoute(
            name: Routes.changePasswordPage,
            path: 'change-password',
            pageBuilder: (context, state) => const MaterialPage(
              child: Scaffold(
                body: Center(
                  child: Text('Change Password'),
                ),
              ),
            ),
          ),
        ],
      ),
    ],
    errorPageBuilder: (context, state) => MaterialPage(
      child: ErrorPage(error: state.error.toString()),
    ),
  );
}
