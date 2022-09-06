import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/pages/welcome_page.dart';

const kDebugMode = true;

void main() {
  runApp(DevicePreview(
    builder: (context) => const MyApp(),
    enabled: kDebugMode,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OLO Games',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: backgroundColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
            foregroundColor: MaterialStateProperty.all(Colors.white),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            overlayColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.pressed)) {
                return primaryColor;
              } else {
                return Color.lerp(primaryColor, Colors.white, 0.1);
              }
            }),
          ),
        ),
        textTheme: TextTheme(
          // TODO: Поменять на displayMedium
          headline4: GoogleFonts.roboto(fontSize: 44, color: Colors.white),
          // TODO: Поменять на caption
          bodyText2: GoogleFonts.roboto(fontSize: 13),
          bodyText1: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.7)),
        ),
        fontFamily: 'Roboto',
      ),
      home: const WelcomePage(),

      //DevicePreview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
