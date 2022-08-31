import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_manager/sources/models/providers.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../crypto/hash_md5.dart';
import '../crypto/encrypt_aes.dart';

void addMasterPassword(String password, WidgetRef ref) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String masterPassword = hashMD5(password);

  prefs.setBool("isSignUp", true);
  ref.read(masterPasswordProvider.notifier).state = masterPassword;
  prefs.setString(
    "masterPasswordIndice",
    encryptAES(masterPassword, "masterPasswordIndice").base64,
  );
}
