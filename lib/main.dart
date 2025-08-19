import 'package:device_preview_plus/device_preview_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabasewithubereatsuser/register_page.dart';
import 'package:supabasewithubereatsuser/update_password_page.dart';
import 'package:supabasewithubereatsuser/deep_link_handler.dart';

import 'forgot_password_page.dart';
import 'home.dart';
import 'login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// TODO: replace with your credentials
  await Supabase.initialize(
    url: 'https://kirhitjejcjimdfzotse.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImtpcmhpdGplamNqaW1kZnpvdHNlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTU1NjUxNDQsImV4cCI6MjA3MTE0MTE0NH0.Xfk9wFjIjbav-ZYN58yH05Aelxk9yHTuEICMBUOtD3E',
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) =>
          DeepLinkHandler(child: MyApp()), // Wrap your app with DeepLinkHandler
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          ),
          routes: {
            '/forgot-password': (context) => ForgotPasswordPage(),
            '/register': (context) => RegisterPage(),
            '/login': (context) => Login(),
            '/home': (context) => Home(),
            '/update-password': (context) => const UpdatePasswordPage(),
          },
          home: const Login(),
        );
      },
    );
  }
}
