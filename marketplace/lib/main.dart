import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/pages/cart_page.dart';
import 'package:marketplace/presentation/pages/home_page.dart';
import 'package:marketplace/presentation/pages/login_page.dart';
import 'package:marketplace/presentation/pages/login_with_email_page.dart';
import 'package:marketplace/presentation/pages/signup_page.dart';
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
        colorScheme: const ColorScheme.dark().copyWith(
          primary: primaryColor,
        ),
        scaffoldBackgroundColor: backgroundColor,
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return primaryColor.withOpacity(0.5);
              } else {
                return primaryColor;
              }
            }),
            foregroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return Colors.white.withOpacity(0.5);
              } else {
                return Colors.white;
              }
            }),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
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
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(
              color:
                  Color.lerp(primaryColor, Colors.white, 0.2) ?? primaryColor,
            ),
          ),
          constraints: const BoxConstraints(minHeight: 42, maxHeight: 42),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(color: primaryColor),
          fillColor: MaterialStateProperty.all(primaryColor),
        ),
        textTheme: TextTheme(
          headline4: GoogleFonts.roboto(fontSize: 38, color: Colors.white),
          headline5: GoogleFonts.roboto(
            fontSize: 28,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          // TODO: Поменять на caption
          bodyText2: GoogleFonts.roboto(fontSize: 13),
          bodyText1: GoogleFonts.roboto(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.7)),
        ),
        fontFamily: 'Roboto',
      ),
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => LoginPage(),
        '/login/email': (context) => LogWithEmailPage(),
        '/signup': (context) => SignUpPage(),
        '/home': (context) => const HomePage(),
        '/cart': (context) => CartPage(),
      },
      initialRoute: '/welcome',

      //DevicePreview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}