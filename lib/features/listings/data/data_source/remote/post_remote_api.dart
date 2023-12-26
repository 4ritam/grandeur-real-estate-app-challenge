import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:fpdart/fpdart.dart';
import 'package:grandeur/core/constants/appwrite_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../config/typedefs/typedefs.dart';
import '../../../../../core/providers/appwrite_database.dart';
import '../../../../../core/utils/failure.dart';

final postRemoteApiProvider = Provider<PostRemoteApi>(
  (ref) {
    final databases = ref.read(appwriteDatabaseProvider);
    const databaseId = AppwriteConstants.database;
    const collectionId = AppwriteConstants.collection;
    return PostRemoteApi(
      databases,
      databaseId,
      collectionId,
    );
  },
);

class PostRemoteApi {
  final Databases _databases;
  final String _databaseId;
  final String _collectionId;
  PostRemoteApi(
    final Databases databases,
    final String databaseId,
    final String collectionId,
  )   : _databases = databases,
        _databaseId = databaseId,
        _collectionId = collectionId;

  FutureEither<DocumentList> getPosts() async {
    try {
      final documentList = await _databases.listDocuments(
        databaseId: _databaseId,
        collectionId: _collectionId,
      );
      return right(documentList);
    } catch (e, s) {
      return left(Failure(e.toString(), s));
    }
  }

  FutureEither<Document> getPost(String id) async {
    try {
      final document = await _databases.getDocument(
        databaseId: _databaseId,
        collectionId: _collectionId,
        documentId: id,
      );
      return right(document);
    } catch (e, s) {
      return left(Failure(e.toString(), s));
    }
  }
}
