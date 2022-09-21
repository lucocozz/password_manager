import 'package:encrypt/encrypt.dart';

Encrypted encryptAES(String password, String data) {
  final key = Key.fromBase64(password);
  final iv = IV.fromLength(16);
  final encrypter = Encrypter(AES(key, padding: null));
  final encrypted = encrypter.encrypt(data, iv: iv);
  return encrypted;
}
