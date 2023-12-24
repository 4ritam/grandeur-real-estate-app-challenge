import 'package:grandeur/core/providers/shared_prefs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  late final SharedPreferences _sharedPreferences;
  Future<void> initialize() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  List<Override> overrideDepenedencies() {
    return [
      sharedPreferencesProvider.overrideWithValue(_sharedPreferences),
    ];
  }
}
