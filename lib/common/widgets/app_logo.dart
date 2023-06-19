import 'package:flutter/material.dart';
import 'package:nippo/constant.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: const ExactAssetImage(AssetPath.appLogoPath),
      height: height,
      alignment: FractionalOffset.center,
    );
  }
}
