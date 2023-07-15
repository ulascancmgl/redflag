import 'package:redflag/style/style.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/lang_functions.dart';

class ThemeChanger extends ChangeNotifier {
  final LanguageUtils languageUtils;

  Color scaffoldColor = Colors.blueGrey;

  ThemeChanger(this.languageUtils);

  factory ThemeChanger.withLanguageUtils(LanguageUtils languageUtils) {
    return ThemeChanger(languageUtils);
  }

  Future<void> initializeColor() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? savedColor = prefs.getInt('scaffoldColor');
    if (savedColor != null) {
      scaffoldColor = Color(savedColor);
    }
    notifyListeners();
  }

  void changeColor(Color newColor) async {
    scaffoldColor = newColor;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('scaffoldColor', newColor.value);
    notifyListeners();
  }

  void changeScaffoldColor(BuildContext context, Color newColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('scaffoldColor');
    await prefs.setInt('scaffoldColor', newColor.value);
    ThemeChanger themeChanger =
        Provider.of<ThemeChanger>(context, listen: false);
    themeChanger.changeColor(newColor);
  }

  void showColorPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text(
            languageUtils.getTranslatedString('Select Color'),
            style: AppStyles.bodyLargeText,
          ),
          children: [
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('BlueGrey'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.blueGrey);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Red'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.red);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Green'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.green);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Yellow'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.yellow);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Orange'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.orange);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Purple'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.purple);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Pink'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.pink);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Teal'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.teal);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Cyan'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.cyan);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Amber'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.amber);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Deep Purple'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.deepPurple);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text(
                languageUtils.getTranslatedString('Indigo'),
                style: AppStyles.bodyMediumText,
              ),
              onTap: () {
                changeScaffoldColor(context, Colors.indigo);
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
