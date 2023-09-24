import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({super.key, required this.imageUrl});

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final imageUrl = this.imageUrl;
    final colorScheme = theme.colorScheme;
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: imageUrl == null ? colorScheme.onPrimary : null,
        image: imageUrl == null
            ? null
            : DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
      ),
    );
  }
}
