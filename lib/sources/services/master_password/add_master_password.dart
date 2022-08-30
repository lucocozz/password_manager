import 'package:shared_preferences/shared_preferences.dart';

import '../crypto/hash_md5.dart';
import '../crypto/encrypt_aes.dart';

void addMasterPassword(String password) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  prefs.setBool("isMasterPasswordCreated", true);
  prefs.setString(
    "masterPasswordIndice",
    encryptAES(hashMD5(password), "masterPasswordIndice").base64,
  );
}
