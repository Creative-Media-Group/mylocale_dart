// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'mylocale_dart_platform_interface.dart';
import 'dart:convert';
import 'dart:io';

class MylocaleDartTest {
  Future<String?> getPlatformVersion() {
    return MylocaleDartPlatform.instance.getPlatformVersion();
  }
}

class MylocaleDart {
  Future<String> translate(
      String csvFile, String targetKey, String langCode) async {
    final file = File(csvFile);
    if (!await file.exists()) {
      throw Exception('Die Datei $csvFile existiert nicht.');
    }

    final lines = await file.readAsLines();
    if (lines.isEmpty) {
      throw Exception('Die Datei $csvFile ist leer.');
    }

    final headers = lines.first.split(',');

    final rows = lines.skip(1).map((line) {
      final values = line.split(',');
      return Map<String, String>.fromIterables(headers, values);
    }).toList();

    for (final item in rows) {
      if (item['stringname'] == targetKey) {
        final langValue = item[langCode];
        if (langValue == null || langValue.isEmpty) {
          return item['en'] ?? '';
        } else {
          return langValue;
        }
      }
    }

    return '';
  }
}
