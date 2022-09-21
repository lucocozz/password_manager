import 'package:dargon2_flutter/dargon2_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<bool> checkMasterPassword(String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? hash = prefs.getString('masterPassword');

  if (hash == null) {
    return false;
  }
  try {
    final verify = await argon2.verifyHashString(password, hash);
    return verify;
  } catch (error) {
    return false;
  }
}
