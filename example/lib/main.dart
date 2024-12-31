import 'package:flutter/material.dart';
import 'package:mylocale_dart/mylocale_dart.dart'; // Importiere das Skript

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Erforderlich für rootBundle

  // Übersetzung abrufen
  final translation =
      await translate('assets/localisation/localisation.csv', 'CONTENT', 'de');

  runApp(MyApp(translation: translation));
}

class MyApp extends StatelessWidget {
  final String translation;

  const MyApp({super.key, required this.translation});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSV Übersetzer',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Übersetzer'),
        ),
        body: Center(
          child: Text(
            translation,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
