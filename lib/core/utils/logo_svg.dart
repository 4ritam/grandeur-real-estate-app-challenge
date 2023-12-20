import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/assets_constants.dart';

class LogoSvg extends StatelessWidget {
  const LogoSvg({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      SVGConstants.logo,
      color: Theme.of(context).colorScheme.onBackground,
      semanticsLabel: "Grandeur Logo",
      alignment: Alignment.bottomCenter,
    );
  }
}
