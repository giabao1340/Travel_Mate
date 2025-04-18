import 'package:flutter/material.dart';
import 'auth/login_screen.dart';
import 'homescreen.dart';
import 'auth/register_screen.dart';
import 'introscreen.dart';
import 'auth/forgot_password_screen.dart';
import 'auth/otp_verification_screen.dart';
import 'auth/reset_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel Mate',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const IntroScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/register': (context) => const RegisterScreen(),
        '/introscreen': (context) => const IntroScreen(),
        '/forgotpassword': (context) => const ForgotPasswordScreen(),
        '/otpverification': (context) => const OtpVerificationScreen(),
        '/resetpassword': (context) => const ResetPasswordScreen(),
      },
    );
  }
}
