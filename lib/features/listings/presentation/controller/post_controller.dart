import 'package:flutter/material.dart';
import 'package:grandeur/core/utils/utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../data/repository/post_repository.dart';
import '../../domain/model/post.dart';

final postControllerProvider = Provider<PostController>((ref) {
  final postRepository = ref.read(postRepositoryProvider);
  return PostController(postRepository);
});

final postProvider = FutureProvider.family<Post, String>((ref, args) async {
  final postController = ref.read(postControllerProvider);
  final result = await postController.getPost(args);
  return result!;
});

final postsProvider =
    FutureProvider.family<List<Post>, BuildContext>((ref, context) async {
  final postController = ref.read(postControllerProvider);
  final result = await postController.getPosts(context);
  return result;
});

class PostController {
  final PostRepository _repository;

  PostController(this._repository);

  Future<List<Post>> getPosts(BuildContext context) async {
    final result = await _repository.getPosts();
    return result.fold(
      (l) {
        Snackbar.show(context, l.message.toString(), ResultType.error);
        return [];
      },
      (r) => r,
    );
  }

  Future<Post?> getPost(String id) async {
    final response = await _repository.getPost(id);
    return response.fold((l) {
      return null;
    }, (r) {
      return r;
    });
  }
}
