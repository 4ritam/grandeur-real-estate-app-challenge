import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:grandeur/core/constants/assets_constants.dart';
import 'package:grandeur/core/extras/cookies_use.dart';
import 'package:grandeur/core/extras/privacy_policy.dart';
import 'package:grandeur/core/extras/terms.dart';
import 'package:grandeur/core/utils/informative_bottom_sheet.dart';
import 'package:grandeur/core/utils/logo_svg.dart';
import 'package:grandeur/core/widgets/primary_button.dart';
import 'package:grandeur/core/widgets/secondary_button.dart';

import '../../../../config/routes/routes.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(0),
              child: Container(
                  height: 32,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  )),
            ),
            pinned: true,
            floating: false,
            backgroundColor: Theme.of(context).colorScheme.background,
            toolbarHeight: MediaQuery.of(context).size.height * 0.125,
            collapsedHeight: MediaQuery.of(context).size.height * 0.125,
            expandedHeight: MediaQuery.of(context).size.height * 0.5,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                ImageConstants.buildingBackground,
                filterQuality: FilterQuality.low,
                color:
                    Theme.of(context).colorScheme.background.withOpacity(0.65),
                colorBlendMode: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? BlendMode.softLight
                    : BlendMode.multiply,
                fit: BoxFit.cover,
              ),
              title: const LogoSvg(),
              centerTitle: true,
              titlePadding: const EdgeInsets.only(bottom: 0),
            ),
          ),
          SliverToBoxAdapter(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16, bottom: 24),
                      child: Text(
                        "Let your heart be your 🧭 We'll map the way 🏡",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 26,
                          fontWeight: FontWeight.w800,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 48),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          "Come Onboard Today!",
                          style: TextStyle(
                            color: Theme.of(context)
                                .colorScheme
                                .onBackground
                                .withOpacity(0.7),
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: PrimaryButton(
                            onPressed: () {
                              context.pushNamed(Routes.login);
                            },
                            child: Text(
                              'Log In',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.onPrimary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: SecondaryButton(
                            onPressed: () {
                              context.pushNamed(Routes.signup);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSecondary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.3),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'OR',
                              style: TextStyle(
                                color: Theme.of(context)
                                    .colorScheme
                                    .onBackground
                                    .withOpacity(0.6),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Divider(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onBackground
                                  .withOpacity(0.3),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SecondaryButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SVGConstants.googleLogo,
                            semanticsLabel: "Google Logo",
                            height: 26,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Continue with Google',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SecondaryButton(
                      onPressed: () {},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SVGConstants.facebookLogo,
                            semanticsLabel: "Facebook Logo",
                            height: 26,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Continue with Facebook',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SecondaryButton(
                      onPressed: () {  },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            SVGConstants.twitterLogo,
                            semanticsLabel: "X Logo",
                            height: 26,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Text(
                            'Continue with X',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSecondary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Divider(
                      color: Theme.of(context)
                          .colorScheme
                          .onBackground
                          .withOpacity(0.3),
                      thickness: 2,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16, bottom: 64, left: 8, right: 8),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .onSecondary
                                .withOpacity(0.7),
                          ),
                          children: [
                            const TextSpan(
                              text: "By signing up, you agree to our ",
                            ),
                            TextSpan(
                              style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
                                color:
                                    Theme.of(context).colorScheme.onBackground,
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
          )
        ],
      ),
    );
  }
}
