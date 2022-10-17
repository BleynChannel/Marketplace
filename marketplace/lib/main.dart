import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marketplace/presentation/colors.dart';
import 'package:marketplace/presentation/debug_data.dart';
import 'package:marketplace/presentation/routes/router.gr.dart';

const kDebugMode = false;

void main() {
  runApp(DevicePreview(
    builder: (context) => MyApp(),
    enabled: kDebugMode,
  ));
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    debugInit().then((value) => null);

    return MaterialApp.router(
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
                return Colors.white54;
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
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: primaryColor),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: BorderSide(color: Colors.grey[400]!),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(40),
            borderSide: const BorderSide(color: primaryColor),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 10),
        ),
        checkboxTheme: CheckboxThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          side: const BorderSide(color: primaryColor),
          fillColor: MaterialStateProperty.all(primaryColor),
        ),
        switchTheme: SwitchThemeData(
          trackColor: MaterialStateProperty.resolveWith((states) {
            Color trackColor = states.contains(MaterialState.selected)
                ? primaryColor
                : Colors.grey;

            if (states.contains(MaterialState.hovered)) {
              return Color.lerp(trackColor, Colors.white, 0.2);
            } else {
              return trackColor;
            }
          }),
          thumbColor: MaterialStateProperty.resolveWith((states) {
            Color thumbColor = states.contains(MaterialState.selected)
                ? accentColor
                : Colors.white;

            if (states.contains(MaterialState.hovered)) {
              return Color.lerp(thumbColor, Colors.white, 0.2);
            } else {
              return thumbColor;
            }
          }),
        ),
        snackBarTheme: SnackBarThemeData(
          backgroundColor: Color.lerp(backgroundColor, Colors.white, 0.025),
          contentTextStyle: TextStyle(
            color: ThemeData().errorColor,
          ),
        ),
        textTheme: TextTheme(
          headline4: GoogleFonts.roboto(
            fontSize: 38,
            color: Colors.white,
          ),
          headline5: GoogleFonts.roboto(
            fontSize: 28,
            color: Colors.white,
          ),
          headline6: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.white,
          ),
          caption: GoogleFonts.roboto(
            fontSize: 13,
            color: Colors.white,
          ),
          bodyText1: GoogleFonts.roboto(
            fontSize: 14,
            color: Colors.white70,
          ),
        ),
        fontFamily: 'Roboto',
      ),

      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),

      // DevicePreview
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
