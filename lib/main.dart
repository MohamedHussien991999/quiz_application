// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:quiz_application/modules/welcome/welcome_screen.dart';
import 'package:quiz_application/shared/network/local/cache_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: WelcomeScreen(),
    );
  }
}
