import 'package:flutter/material.dart';
import 'package:nippo/features/post/post_list_view.dart';
import 'package:nippo/gen/assets.gen.dart';
import 'package:nippo/router.dart';

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
          // TODO(htsuruo): ダークモード用のロゴを用意して差し替える
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
          PostCreatePageRoute().go(context);
        },
        child: const Icon(Icons.mode_edit),
      ),
    );
  }
}
