import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:nippo/core/router/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tsuruo_kit/tsuruo_kit.dart';

import '../model/post.dart';
import '../post_repository.dart';

part 'post_action_handler.g.dart';

@Riverpod(keepAlive: true)
PostActionHandler postAction(PostActionRef ref) => PostActionHandler(ref);

class PostActionHandler {
  PostActionHandler(this._ref);
  final Ref _ref;

  BuildContext get _context => _ref.read(routerProvider).navigator.context;

  // TODO(htsuruo): 編集処理
  Future<void> edit({required DocumentSnapshot<Post> postSnap}) async {}

  Future<void> delete({required DocumentSnapshot<Post> postSnap}) async {
    final post = postSnap.data()!;
    if (OkCancelResult.ok ==
        await showOkCancelAlertDialog(
          context: _context,
          title: '確認',
          message: '本当に削除しますか？',
        )) {
      _ref.read(postRepositoryProvider).delete(postRef: postSnap.reference);
      _ref
          .read(scaffoldMessengerKey)
          .currentState!
          .showMessage('[${post.title}]を削除しました');
      _context.pop();
    }
  }
}
