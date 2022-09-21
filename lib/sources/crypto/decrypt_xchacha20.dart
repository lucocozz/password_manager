import 'package:cryptography/cryptography.dart';

Future<String> decryptXChaCha20(SecretBox secretBox, List<int> key) async {
  final algo = Xchacha20(macAlgorithm: MacAlgorithm.empty);
  final secretKey = await algo.newSecretKeyFromBytes(key);
  final clearText = await algo.decrypt(
    secretBox,
    secretKey: secretKey,
  );

  return clearText.toString();
}
