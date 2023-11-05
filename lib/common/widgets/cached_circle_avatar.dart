import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedCircleAvatar extends StatelessWidget {
  const CachedCircleAvatar({
    super.key,
    required this.imageUrl,
    this.radius,
    this.onTap,
  });

  final String? imageUrl;
  final double? radius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final placeHolder = CircleAvatar(radius: radius);
    return imageUrl == null
        ? placeHolder
        : CachedNetworkImage(
            imageUrl: imageUrl ?? '',
            placeholder: (context, _) => placeHolder,
            imageBuilder: (context, imageProvider) {
              return CircleAvatar(
                backgroundImage: imageProvider,
                radius: radius,
                child: ClipOval(
                  child: Material(
                    type: MaterialType.transparency,
                    child: InkWell(onTap: onTap),
                  ),
                ),
              );
            },
          );
  }
}
