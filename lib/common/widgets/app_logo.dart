import 'package:flutter/material.dart';
import 'package:nippo/gen/assets.gen.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height = 48});

  final double height;

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return brightness == Brightness.light
        ? Assets.images.logo.logoYokoLight.svg(
            height: height,
          )
        : Assets.images.logo.logoYokoDark.svg(
            height: height,
          );
  }
}
