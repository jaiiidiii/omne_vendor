import 'dart:typed_data';

abstract class FileSystemHelper {
  Future<String> storeBytesToTemporaryDirectory({
    required String filePath,
    required Uint8List byteArray,
  });

  Future<void> clearTemporaryDirectory();
}
