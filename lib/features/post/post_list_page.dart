import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nippo/features/post/post_list_view.dart';
import 'package:nippo/gen/assets.gen.dart';

class PostListPage extends StatelessWidget {
  const PostListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Assets.images.icons.nippoYoko.svg(
          height: 24,
          // TODO(htsuruo): ダークモード用のロゴを用意するのが定石
          colorFilter: theme.brightness == Brightness.light
              ? null
              : ColorFilter.mode(
                  colorScheme.onSurface,
                  BlendMode.srcIn,
                ),
        ),
      ),
      body: const PostListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.go('/posts/create');
        },
        child: const Icon(Icons.mode_edit),
      ),
    );
  }
}
