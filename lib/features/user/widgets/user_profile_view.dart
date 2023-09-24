import 'package:flutter/material.dart';
import 'package:nippo/common/widgets/circular_image.dart';

import '../user.dart';

class UserProfileView extends StatelessWidget {
  const UserProfileView({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: CircularImage(
            imageUrl: user.photoUrl,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Text(
            user.name,
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
