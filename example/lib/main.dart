import 'package:flutter/material.dart';
import 'package:mylocale_dart/mylocale_dart.dart';
import 'package:mylocalization/mylocalization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSV Übersetzer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TranslatorPage(),
    );
  }
}

class TranslatorPage extends StatelessWidget {
  static const file = "assets/localisation/localisation.csv";
  static var locale = MyLocalization;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('CSV Übersetzer')),
      body: FutureBuilder<String>(
        future: translate('assets/localisation/localisation.csv', 'DEMO',
            locale), // Übersetzung laden
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Ladeanzeige
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Fehler: ${snapshot.error}')); // Fehleranzeige
          } else {
            return Center(
              child: Text(
                snapshot.data ?? 'Keine Übersetzung gefunden',
                style: TextStyle(fontSize: 24),
              ),
            );
          }
        },
      ),
    );
  }
}
