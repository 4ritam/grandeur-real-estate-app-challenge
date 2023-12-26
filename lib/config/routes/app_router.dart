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
import 'package:grandeur/features/listings/presentation/pages/post_page.dart';
import 'package:grandeur/features/tab_view/presentation/pages/view_template.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/providers/authentication.dart';
import '../../features/listings/domain/model/post.dart';

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    final isAuthenticated = ref.watch(authenticationProvider);

    return GoRouter(
      initialLocation: isAuthenticated ? '/' : '/get-started',
      redirect: (context, state) async {
        if (!isAuthenticated &&
            !state.fullPath.toString().startsWith('/get-started')) {
          return '/get-started';
        } else {
          return null;
        }
      },
      routes: [
        GoRoute(
          name: Routes.getStarted,
          path: '/get-started',
          pageBuilder: (context, state) => const MaterialPage(
            child: GetStartedPage(),
          ),
          routes: [
            GoRoute(
              name: Routes.login,
              path: 'login',
              pageBuilder: (context, state) => const MaterialPage(
                child: LoginPage(),
              ),
              routes: [
                GoRoute(
                  name: Routes.forgotPassword,
                  path: 'forgot-password',
                  pageBuilder: (context, state) => const MaterialPage(
                    child: ForgotPasswordPage(),
                  ),
                ),
              ],
            ),
            GoRoute(
              name: Routes.signup,
              path: 'signup',
              pageBuilder: (context, state) => const MaterialPage(
                child: SignUpPage(),
              ),
            ),
          ],
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
          path: '/',
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
              pageBuilder: (context, state) {
                return MaterialPage(
                  child: PostPage(
                    id: state.pathParameters['id']!,
                    post: state.extra as Post,
                  ),
                );
              },
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
  },
  name: 'GoRouter',
);
