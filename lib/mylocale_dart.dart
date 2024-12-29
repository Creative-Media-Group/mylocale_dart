// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'mylocale_dart_platform_interface.dart';
import 'dart:io';

Future<String> translate(
    String csvFile, String targetKey, String langCode) async {
  final file = File(csvFile);
  final lines = await file.readAsLines();

  if (lines.isEmpty) return '';

  final headers = lines.first.split(',');
  final rows = lines.skip(1).map((line) {
    final values = line.split(',');
    return Map<String, String>.fromIterables(headers, values);
  });

  for (final row in rows) {
    if (row['stringname'] == targetKey) {
      // Falls die gewünschte Sprache leer ist, Fallback auf Englisch
      return row[langCode]?.isEmpty ?? true ? row['en'] ?? '' : row[langCode]!;
    }
  }
  return '';
}
