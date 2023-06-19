import 'package:flutter/material.dart';
import 'package:nippo/models/entities/user.dart';

import 'profile_circle_image.dart';

class ProfileArea extends StatelessWidget {
  const ProfileArea({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ProfileCircleImage(
            imageUrl: user.photoUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            user.displayName,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Text(user.email),
        ),
      ],
    );
  }
}
