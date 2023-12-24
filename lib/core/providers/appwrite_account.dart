import 'package:appwrite/appwrite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'appwrite_client.dart';

final appwriteAccountProvider = Provider<Account>(
  (ref) {
    final client = ref.watch(appwriteClientProvider);
    return Account(client);
  },
  name: 'Appwrite Account',
);
