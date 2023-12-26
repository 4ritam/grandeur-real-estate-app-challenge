import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'appwrite_client.dart';

final appwriteDatabaseProvider = Provider<Databases>(
  (ref) {
    final client = ref.watch(appwriteClientProvider);
    return Databases(client);
  },
  name: 'Appwrite Databases',
);
