import 'package:fpdart/fpdart.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/typedefs/typedefs.dart';
import '../../domain/model/post.dart';
import '../data_source/remote/post_remote_api.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  final postRemoteApi = ref.read(postRemoteApiProvider);
  return PostRepository(postRemoteApi: postRemoteApi);
});

class PostRepository {
  final PostRemoteApi _postRemoteApi;

  const PostRepository({
    required PostRemoteApi postRemoteApi,
  }) : _postRemoteApi = postRemoteApi;

  FutureEither<List<Post>> getPosts() async {
    final result = await _postRemoteApi.getPosts();
    return result.fold(
      (l) => left(l),
      (r) {
        final posts = r.documents.map((e) => Post.fromMap(e.data)).toList();
        return right(posts);
      },
    );
  }

  FutureEither<Post> getPost(String id) async {
    final result = await _postRemoteApi.getPost(id);
    return result.fold(
      (l) => left(l),
      (r) {
        final post = Post.fromMap(r.data);
        return right(post);
      },
    );
  }
}
