import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_prefs.dart';

final authenticationProvider = StateNotifierProvider<Authentication, bool>(
  (ref) {
    Authentication authentication =
        Authentication(sharedPreferences: ref.watch(sharedPreferencesProvider));
    authentication.initialize();
    return authentication;
  },
  name: 'Appwrite Authentication',
);

class Authentication extends StateNotifier<bool> {
  final SharedPreferences _sharedPreferences;
  Authentication({required SharedPreferences sharedPreferences})
      : _sharedPreferences = sharedPreferences,
        super(false);

  Future<void> initialize() async {
    final isAuthenticated =
        _sharedPreferences.getBool('isAuthenticated') ?? false;
    state = isAuthenticated;
  }

  void toggle() {
    state = !state;
    _sharedPreferences.setBool('isAuthenticated', state);
  }
}
