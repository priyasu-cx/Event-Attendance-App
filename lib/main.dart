import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gdgkolkata/service/core/service_locator.dart';
import 'package:gdgkolkata/utils/colors.dart';
import 'package:gdgkolkata/views/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Get.reset();
  setupServiceLocator();
  runApp(const ProviderScope(
      child: DevfestInternalApp()
  ));
}

class DevfestInternalApp extends StatelessWidget {
  const DevfestInternalApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GDG Kolkata',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: DevfestColor.bgcolor,
          textTheme: GoogleFonts.openSansTextTheme(
            Theme.of(context).textTheme,
          ),
          appBarTheme: const AppBarTheme(
            elevation: 0, // This removes the shadow from all App Bars.
          )),
      home: toPage(),
    );
  }

  toPage() => const SplashScreen();
}

