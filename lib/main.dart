import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paper_safe_v2/features/Auth/views/pages/create_user.dart';
import 'package:paper_safe_v2/features/Auth/views/pages/otp_verification.dart';
import 'package:paper_safe_v2/features/Home/views/homepage.dart';
import 'package:paper_safe_v2/features/Onboarding/views/onboarding.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.white,
    ));
    return MaterialApp(
      title: 'PaperSafe',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: UserInfo(),
    );
  }
}
