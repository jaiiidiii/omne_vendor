
import 'dart:io';
import 'dart:typed_data';

import 'package:commons/helpers/file_system_helper/file_system_helper.dart';
import 'package:path_provider/path_provider.dart';

class FileSystemHelperImplementation extends FileSystemHelper {
  Future<Directory> get tempDir async => getTemporaryDirectory();

  Future<String> get tempDirectoryPath async {
    return (await tempDir).path;
  }

  /// Returns Full Filepath
  @override
  Future<String> storeBytesToTemporaryDirectory({
    required String filePath,
    required Uint8List byteArray,
  }) async {
    final tempFilePath = '${await tempDirectoryPath}/$filePath';
    final file = File(tempFilePath);

    await file.writeAsBytes(byteArray, flush: true);

    return tempFilePath;
  }

  @override
  Future<void> clearTemporaryDirectory() async {
    await (await tempDir).delete(recursive: true);
  }
}
