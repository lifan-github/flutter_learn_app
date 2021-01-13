import 'package:flutter/material.dart';

class LocalizationPage extends StatefulWidget {
  @override
  _LocalizationPageState createState() => _LocalizationPageState();
}

class _LocalizationPageState extends State<LocalizationPage> {
  @override
  Widget build(BuildContext context) {
    Locale myLocale = Localizations.localeOf(context);
    print('myLocale--->$myLocale');

    return Scaffold(
      appBar: AppBar(
        title: Text('语言切换'),
      ),
      body: Column(
        children: <Widget>[
          Text('语言切换'),
        ]
      ),
    );
  }
}