// lib/config/app_routes.dart
import 'package:flutter/material.dart';
import 'package:travel_mate/main.dart';
import 'package:travel_mate/modules/intro/screens/introscreen.dart';
import 'package:travel_mate/modules/home/screens/favorite_screen.dart';
import 'package:travel_mate/modules/profile/ui/profile_screen.dart';
import 'package:travel_mate/modules/search/screens/search_screen.dart';
import 'package:travel_mate/modules/auth/screens/login_screen.dart';
import 'package:travel_mate/modules/auth/screens/register_screen.dart';
import 'package:travel_mate/modules/auth/screens/forgot_password_screen.dart';
import 'package:travel_mate/modules/auth/screens/otp_verification_screen.dart';
import 'package:travel_mate/modules/auth/screens/reset_password_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/introscreen': (context) => const IntroScreen(),
  '/login': (context) => const LoginScreen(),
  '/register': (context) => const RegisterScreen(),
  '/forgotpassword': (context) => const ForgotPasswordScreen(),
  '/otpverification': (context) => const OtpVerificationScreen(),
  '/resetpassword': (context) => const ResetPasswordScreen(),
  '/home': (context) => const HomeScreen(),
  '/favoritescreen': (context) => const FavoriteScreen(),
  '/profilescreen': (context) => const ProfileScreen(),
  '/searchscreen': (context) => const SearchScreen(),
};
