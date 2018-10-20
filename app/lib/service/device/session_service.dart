import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

final String _emailKey = 'email';

Future<SharedPreferences> _getPrefs() async => SharedPreferences.getInstance();

saveEmail(String email) async {
  var prefs = await _getPrefs();
  await prefs.setString(_emailKey, email);
}

deleteEmail() async {
  await _removePref(_emailKey);
}

Future<String> getEmail() async => _getPref(_emailKey);

Future<String> _getPref(String key) async {
  var prefs = await _getPrefs();
  var token = prefs.getString(key);

  return token;
}

Future<void> _removePref(String key) async {
  var prefs = await _getPrefs();
  await prefs.remove(key);
}
