import 'package:encrypt/encrypt.dart';

String decryptAES(String password, String data) {
  final key = Key.fromBase64(password);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key, padding: null));
  String decrypted = encrypter.decrypt(Encrypted.fromBase64(data), iv: iv);
  return decrypted;
}
