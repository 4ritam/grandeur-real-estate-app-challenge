import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/config/routes/routes.dart';
import 'package:grandeur/core/utils/informative_bottom_sheet.dart';
import 'package:grandeur/core/utils/logo_svg.dart';
import 'package:grandeur/core/widgets/boxed_text_field.dart';
import 'package:grandeur/core/widgets/primary_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/extras/extras.dart';
import '../../../../core/widgets/back_button.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void handleLogin() {
      String email = emailController.text;
      String password = passwordController.text;
      print('Email: $email, Password: $password');
    }

    return Scaffold(
      appBar: AppBar(
        leading: const FittedBox(
          fit: BoxFit.fitWidth,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: BackCircularButton(),
          ),
        ),
        title: const FittedBox(
          fit: BoxFit.fitWidth,
          child: SizedBox(width: 150, height: 150, child: LogoSvg()),
        ),
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.125,
        leadingWidth: MediaQuery.of(context).size.width * 0.20,
      ),
      body: Center(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Unleash the 💪 within this 🧭',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w800,
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(height: 48.0),
                BoxedTextField(
                  hintText: 'Email',
                  controller: emailController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                BoxedTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: handleLogin,
                    child: Text(
                      'Login',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          context.pushNamed( Routes.forgotPassword);
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onBackground,
                              fontWeight: FontWeight.w600,
                              fontSize: 14.0),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          context.replaceNamed(Routes.signup);
                        },
                        child: Text(
                          'Create New Account',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w600,
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 16),
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondary
                            .withOpacity(0.7),
                      ),
                      children: [
                        const TextSpan(
                          text: "By continuing, you agree to our ",
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                          text: "Terms",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showInformativeBottomSheet(
                                  context: context,
                                  title: "Terms",
                                  information: [generateTerms()]);
                            },
                        ),
                        const TextSpan(
                          text: ", ",
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                          text: "Privacy Policy",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showInformativeBottomSheet(
                                  context: context,
                                  title: "Privacy Policy",
                                  information: [generatePrivacyPolicy()]);
                            },
                        ),
                        const TextSpan(
                          text: " and ",
                        ),
                        TextSpan(
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontWeight: FontWeight.w600,
                          ),
                          text: "Cookies Use",
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              showInformativeBottomSheet(
                                  context: context,
                                  title: "Cookies Usage",
                                  information: [generateCookiesUsage()]);
                            },
                        ),
                        const TextSpan(
                          text: ". ",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
