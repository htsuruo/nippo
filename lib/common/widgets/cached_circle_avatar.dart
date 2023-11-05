import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircleAvatar extends StatelessWidget {
  const CachedCircleAvatar({super.key, required this.imageUrl, this.radius});

  final String? imageUrl;
  final double? radius;

  @override
  Widget build(BuildContext context) {
    final placeHolder = CircleAvatar(radius: radius);
    return CachedNetworkImage(
      imageUrl: imageUrl ?? '',
      placeholder: (context, _) => placeHolder,
      imageBuilder: (context, imageProvider) {
        return CircleAvatar(
          backgroundImage: imageProvider,
          radius: radius,
        );
      },
    );
  }
}
