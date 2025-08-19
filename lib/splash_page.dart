// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:supabasewithubereatsuser/main.dart'; // Import to get the global 'supabase' client

// class SplashPage extends StatefulWidget {
//   const SplashPage({super.key});

//   @override
//   State<SplashPage> createState() => _SplashPageState();
// }

// class _SplashPageState extends State<SplashPage> {
//   StreamSubscription<AuthState>? _authSubscription;

//   @override
//   void initState() {
//     super.initState();
//     // We use addPostFrameCallback to ensure the widget is built before we try to navigate
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _setupAuthListener();
//     });
//   }

//   /// Sets up a listener to Supabase auth state changes.
//   /// This is crucial for handling deep links like password recovery.
//   void _setupAuthListener() {
//     _authSubscription = Supabase.instance.client.auth.onAuthStateChange.listen((data) {
//       final AuthChangeEvent event = data.event;

//       // If the event is for password recovery, navigate to the update password page.
//       if (event == AuthChangeEvent.passwordRecovery) {
//         // Cancel the subscription to prevent multiple navigations
//         _authSubscription?.cancel();
//         // Use pushReplacementNamed to go to the update password page
//         Navigator.of(context).pushReplacementNamed('/update-password');
//       }
//     });

//     // After setting up the listener, check the initial session.
//     _redirect();
//   }

//   /// Redirects the user to the appropriate page based on their session.
//   Future<void> _redirect() async {
//     // A short delay to allow the splash screen to be visible
//     await Future.delayed(const Duration(seconds: 1));

//     // If the widget is no longer in the tree, do nothing
//     if (!mounted) return;

//     final session = Supabase.instance.client.auth.currentSession;

//     if (session != null) {
//       // If a user is logged in, go to the home page
//       Navigator.of(context).pushReplacementNamed('/home');
//     } else {
//       // Otherwise, go to the login page
//       Navigator.of(context).pushReplacementNamed('/login');
//     }
//   }

//   @override
//   void dispose() {
//     // Always cancel the subscription to prevent memory leaks
//     _authSubscription?.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     // A simple loading indicator while we determine the user's auth state
//     return const Scaffold(
//       body: Center(
//         child: CircularProgressIndicator(),
//       ),
//     );
//   }
// }
