import 'package:flutter/material.dart';
import 'package:nippo/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, required this.height});
  final double height;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: ExactAssetImage(Assets.images.icMainLogo.path),
      height: height,
      alignment: FractionalOffset.center,
    );
  }
}
