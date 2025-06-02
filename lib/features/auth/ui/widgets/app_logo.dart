import 'package:crafty/app/asset_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.width, this.hight});

  final double? width;
  final double? hight;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      AssetPath.appLogoSvg,
      width: width ?? 120,
      height: hight,
      fit: BoxFit.scaleDown,
    );
  }
}
