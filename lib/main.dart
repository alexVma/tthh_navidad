

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tthh_navidad/router.dart';
import 'dart:ui' as ui;
import 'package:tthh_navidad/src/landing_page/html_handler.dart';
import 'dart:io';

import 'package:tthh_navidad/src/movile/main_menu/ui/screens/MainMenu.dart';


void main() {
  // ignore: undefined_prefixed_name
  /*ui.platformViewRegistry.registerViewFactory(
      'hello-html',
      (int viewId) => IFrameElement()
        ..src = 'assets/resources/html/index.html'
        ..style.border = 'none');*/
  RouterFluro.setupRouter();
  HttpOverrides.global = MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Christmas Party',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouterFluro.router.generator,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
        useMaterial3: true,
      ),
      home: kIsWeb?const HTMLWidget():MainMenu(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
