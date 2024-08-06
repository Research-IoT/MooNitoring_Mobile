import 'dart:ui';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:location/location.dart';
import 'package:moonitoring/app/utils/utils.dart';

import 'firebase_options.dart';
import 'app/themes/themes.dart';
import 'app/data/prefs/prefs.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.android,
  );

  final messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  Location location = Location();
  await location.requestPermission();

  const fatalError = true;
  FlutterError.onError = (errorDetails) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
      // ignore: dead_code
    } else {
      FirebaseCrashlytics.instance.recordFlutterError(errorDetails);
    }
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    if (fatalError) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      // ignore: dead_code
    } else {
      FirebaseCrashlytics.instance.recordError(error, stack);
    }
    return true;
  };

  FirebaseMessaging.onMessage.listen((message) {
    RemoteNotification? element = message.notification;

    Get.snackbar(
      element!.title!,
      element.body!,
    );
  });

  await Prefs.init();

  if (!Prefs.getFirstTime() && Prefs.getLogin()) {
    final isLoggedIn = await Utils.checkLoginStatus();

    Prefs.setLogin(Prefs.login, isLoggedIn);

    if (!isLoggedIn) {
      Prefs.setString(Prefs.token, 'token');
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Moo Nitoring',
      debugShowCheckedModeBanner: true,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      theme: ThemeData(
        primaryColor: AppColor.green,
        primarySwatch: AppPalette.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Poppins',
      ),
    );
  }
}
