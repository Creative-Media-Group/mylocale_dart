import 'package:flutter/material.dart';
import 'package:mylocale_dart/mylocale_dart.dart';
import 'package:mylocalization/mylocalization.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CSV Übersetzer',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: TranslatorPage(),
    );
  }
}

class TranslatorPage extends StatefulWidget {
  const TranslatorPage({super.key});

  @override
  TranslatorPageState createState() => TranslatorPageState();
}

class TranslatorPageState extends State<TranslatorPage> {
  String locale = MyLocalization().getDeviceLocale();
  String translatedTitle = '';
  String translatedContent = '';
  String file = "assets/localisation/localisation.csv";

  @override
  void initState() {
    super.initState();
    _loadTranslation();
  }

  Future<void> _loadTranslation() async {
    final title = await translate(file, 'TITLE', locale);
    final content = await translate(file, 'CONTENT', locale);

    setState(() {
      translatedTitle = title;
      translatedContent = content;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(translatedTitle)),
      body: Center(
        child: Text(
          translatedTitle,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
