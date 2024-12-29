// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/to/pubspec-plugin-platforms.

import 'mylocale_dart_platform_interface.dart';
import 'package:flutter/services.dart';
import 'package:csv/csv.dart';

Future<String> translate(
    String csvFile, String targetKey, String langCode) async {
  // Lade die Datei aus dem Asset-Verzeichnis
  final rawData = await rootBundle.loadString('assets/csv/$csvFile');

  // Konvertiere den Inhalt der CSV-Datei in eine Liste
  List<List<dynamic>> csvData = CsvToListConverter().convert(rawData);

  if (csvData.isEmpty) return '';

  // Spaltenüberschriften und Datenreihen verarbeiten
  final headers = csvData.first.cast<String>();
  final rows = csvData.skip(1);

  for (final row in rows) {
    final rowData =
        Map<String, String>.fromIterables(headers, row.cast<String>());
    if (rowData['stringname'] == targetKey) {
      return rowData[langCode]?.isEmpty ?? true
          ? rowData['en'] ?? ''
          : rowData[langCode]!;
    }
  }

  return '';
}
