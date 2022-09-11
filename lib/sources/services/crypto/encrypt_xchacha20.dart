import 'dart:convert';

import 'package:cryptography/cryptography.dart';

Future<SecretBox> encryptXChaCha20(String clearText, List<int> key) async {
  final algo = Xchacha20(macAlgorithm: MacAlgorithm.empty);
  final secretKey = await algo.newSecretKeyFromBytes(key);
  final secretBox = await algo.encrypt(
    utf8.encode(clearText),
    secretKey: secretKey,
  );

  return secretBox;
}
