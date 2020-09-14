import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:components/src/routes/routes.dart';
import 'package:components/src/pages/alert_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('es', 'MX')
      ],
      title: 'Components',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: routes(),
      onGenerateRoute: (RouteSettings settings) {
        print('Route called ${settings.name}');
        return MaterialPageRoute(
          builder: (context) => AlertPage()
        );
      },
    );
  }
}
