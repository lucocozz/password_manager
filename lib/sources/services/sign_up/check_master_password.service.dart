import 'package:shared_preferences/shared_preferences.dart';

import '../crypto/decrypt_aes.dart';
import '../crypto/hash_md5.dart';

Future<bool> checkMasterPassword(String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? encrypted = prefs.getString('masterPasswordIndice');

  if (encrypted == null) {
    return false;
  } else {
    String decrypted = decryptAES(hashMD5(password), encrypted);
    return decrypted == "masterPasswordIndice";
  }
}
