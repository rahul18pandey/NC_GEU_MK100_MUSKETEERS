import 'package:flutter/material.dart';
import 'package:kisan_app/sign_in.dart';
import 'Constants/Constant.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'app_localizations.dart';
import 'constants.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Saksham Kisan',

      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily:'Balthazar',
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        Locale('en','US'),
        Locale('hi','IN')
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,

      ],
      localeResolutionCallback: (locale , supportedLocales){
        for(var supportedLocale in supportedLocales){
          if(supportedLocale.languageCode== locale.languageCode && supportedLocale.countryCode==locale.countryCode){
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      home: new LoginPage(),
    );
  }
}
