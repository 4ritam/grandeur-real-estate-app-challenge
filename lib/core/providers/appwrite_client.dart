import 'package:appwrite/appwrite.dart';
import 'package:grandeur/core/constants/appwrite_constants.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appwriteClientProvider = Provider<Client>(
  (ref) {
    return Client()
        .setEndpoint(AppwriteConstants.endpoint)
        .setProject(AppwriteConstants.project)
        .setSelfSigned(status: true);
  },
  name: 'Appwrite Client',
);
