import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:marketplace/keys.dart';
import 'package:marketplace/presentation/app.dart';

const kDebugMode = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: firebaseApiKey,
      appId: firebaseAppId,
      messagingSenderId: firebaseMessagingSenderId,
      projectId: firebaseProjectId,
    ),
  );

  runApp(DevicePreview(
    builder: (context) => const App(),
    enabled: kDebugMode,
  ));
}
