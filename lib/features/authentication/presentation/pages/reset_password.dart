import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/core/utils/logo_svg.dart';
import 'package:grandeur/core/widgets/boxed_text_field.dart';
import 'package:grandeur/core/widgets/primary_button.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../../core/widgets/back_button.dart';

class ResetPasswordPage extends HookConsumerWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

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
                  'Remember to make it 💪',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontWeight: FontWeight.w800,
                    fontSize: 32.0,
                  ),
                ),
                const SizedBox(height: 48.0),
                BoxedTextField(
                  hintText: 'Password',
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16.0),
                BoxedTextField(
                  hintText: 'Confirm Password',
                  controller: confirmPasswordController,
                  obscureText: false,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    onPressed: () {
                      context.pop();
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.0),
                    ),
                  ),
                ),
                const SizedBox(height: 24.0),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
