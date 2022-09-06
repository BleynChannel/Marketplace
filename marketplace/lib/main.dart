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
          ),
        ),
        textTheme: TextTheme(
          headline4: GoogleFonts.roboto(fontSize: 44, color: Colors.white),
          bodyText2: GoogleFonts.roboto(fontSize: 13),
        ),
      ),
      home: const WelcomePage(),

      //DevicePreview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
