import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/authentication/authenticator.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        AppBar(
          title: const Text('Profile'),
        ),
        Expanded(
          child: Center(
            child: TextButton(
              onPressed: () {
                ref.read(authenticatorProvider.notifier).signOut();
              },
              child: const Text('Sign out'),
            ),
          ),
        ),
      ],
    );
  }
}

// @immutable
// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key});
//   static const String routeName = '/profile';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Container(
//           alignment: Alignment.center,
//           child: Column(
//             children: <Widget>[
//               Padding(
//                 padding: const EdgeInsets.only(right: 16),
//                 child: Container(
//                   alignment: Alignment.centerRight,
//                   child: IconButton(
//                     icon: const Icon(Icons.more_horiz),
//                     onPressed: () {
//                       Navigator.pushNamed(context, SettingPage.routeName);
//                     },
//                   ),
//                 ),
//               ),
//               const SyncArea(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SyncArea extends StatelessWidget {
//   const SyncArea({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final auth = context.select((AuthState s) => s);
//     return Expanded(
//       child: Column(
//         children: <Widget>[
//           ProfileArea(user: auth.user),
//           PostListViewByUser(
//             posts: auth.posts,
//             user: auth.user,
//           )
//         ],
//       ),
//     );
//   }
// }
