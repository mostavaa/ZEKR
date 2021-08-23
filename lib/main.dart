import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:zekr/screens/category-screen.dart';
import 'package:zekr/screens/home-screen.dart';
import 'package:zekr/screens/scroll-category-screen.dart';

import 'locale/app-localizations-delegate.dart';
import 'locale/languages.dart';
import 'locale/locale-constants.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      // ChangeNotifierProvider(
      //   create: (ctx) => AuthProvider(ctx),
      // ),
    ], child: MyApp()),
  );
}

class MyApp extends StatefulWidget {
  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state.setLocale(newLocale);
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() async {
    getLocale().then((locale) {
      setState(() {
        _locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "ZEKR",
      supportedLocales: [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      localizationsDelegates: [
        AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale?.languageCode == locale?.languageCode &&
              supportedLocale?.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales?.first;
      },
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
        CategoryScreen.routeName: (ctx) => CategoryScreen(),
        ScrollCategoryScreen.routeName: (ctx) => ScrollCategoryScreen(),
      },
      theme: ThemeData(
        fontFamily: 'Expo',
        primarySwatch: MaterialColor(0xFFff9100, {
          50: Color(0xFFff9100),
          100: Color(0xFFe68300),
          200: Color(0xFFcc7400),
          300: Color(0xFFb36600),
          400: Color(0xFF995700),
          500: Color(0xFF804900),
          600: Color(0xFF663a00),
          700: Color(0xFF4c2b00),
          800: Color(0xFF331d00),
          900: Color(0xFF190e00),
        }),
        accentColor: Color(0xFFCE009E),
        buttonTheme: ButtonThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
          ),
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
