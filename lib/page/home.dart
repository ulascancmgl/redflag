import 'package:flutter/material.dart';
import '../style/settings_drawer.dart';
import '../style/style.dart';
import '../style/theme_changer.dart';
import '../utils/lang_functions.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ThemeChanger? themeChanger;
  LanguageUtils languageUtils = LanguageUtils();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    languageUtils.loadSelectedLanguage();
    themeChanger = ThemeChanger.withLanguageUtils(languageUtils);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _scaffoldKey.currentState!.openEndDrawer();
            },
          ),
        ],
        title: const Center(
          child: Text('Red Flag', style: AppStyles.bodyLargeText),
        ),
      ),
      endDrawer: AppDrawer(
        themeChanger: themeChanger!,
        languageUtils: languageUtils,
      ),
    );
  }
}
