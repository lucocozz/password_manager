import 'package:dargon2_flutter/dargon2_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:password_manager/sources/models/providers.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void addMasterPassword(String password, WidgetRef ref) async {
  final prefs = await SharedPreferences.getInstance();
  final salt = Salt.newSalt();
  final hash = await argon2.hashPasswordString(
    password,
    salt: salt,
    iterations: 10,
  );

  ref.read(masterPasswordProvider.notifier).state = hash;
  prefs.setString("masterPassword", hash.encodedString);
  prefs.setBool("isSignUp", true);
}
