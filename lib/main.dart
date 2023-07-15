import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:redflag/page/home.dart';
import 'package:redflag/style/style.dart';
import 'package:redflag/style/theme_changer.dart';
import 'package:redflag/utils/lang_functions.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeChanger(LanguageUtils())..initializeColor(),
      child: Consumer<ThemeChanger>(
        builder: (context, themeChanger, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: themeChanger.scaffoldColor,
              textTheme: TextTheme(
                bodySmall: AppStyles.bodySmallText,
                bodyMedium: AppStyles.bodyMediumText,
                bodyLarge: AppStyles.bodyLargeText,
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: AppStyles.elevatedButtonStyle,
              ),
            ),
            home: HomePage(),
            supportedLocales: const [
              Locale('en', ''),
              Locale('tr', ''),
              Locale('fr', ''),
            ],
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
          );
        },
      ),
    );
  }
}
