import 'package:nippo/features/post/create/post_form_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../post_provider.dart';

part 'post_form_controller.g.dart';

@riverpod
class PostFormController extends _$PostFormController {
  @override
  FutureOr<PostFormState> build({required String? postId}) {
    if (postId == null) {
      return const PostFormState();
    }
    final postSnap = ref.watch(postProvider(postId: postId)).value;
    final post = postSnap?.data();
    final title = post?.title ?? '';
    final description = post?.description ?? '';
    return PostFormState(
      title: title,
      description: description,
      postRef: postSnap?.reference,
    );
  }
}
