import 'package:flutter/material.dart';
import 'package:travel_mate/auth/header_widget.dart';
import 'package:travel_mate/introscreen.dart';
import 'package:travel_mate/lists_creen.dart';
import 'package:travel_mate/profile_screen.dart';
import 'package:travel_mate/search_screen.dart';
import 'auth/login_screen.dart';
import 'home_content_screen.dart';
import 'favorite_screen.dart';
import 'auth/register_screen.dart';
import 'auth/forgot_password_screen.dart';
import 'auth/otp_verification_screen.dart';
import 'auth/reset_password_screen.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main() => runApp(const MyApp());

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
        '/forgotpassword': (context) => const ForgotPasswordScreen(),
        '/otpverification': (context) => const OtpVerificationScreen(),
        '/resetpassword': (context) => const ResetPasswordScreen(),
        '/favoritescreen': (context) => const FavoriteScreen(),
        '/introscreen': (context) => const IntroScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int myIndex = 2; // Mặc định là Home

  final List<Widget> screens = const [
    SearchScreen(),
    FavoriteScreen(),
    HomeContentScreen(),
    ListScreen(),
    ProfileScreen(),
  ];

  final String userName = 'Gia Bảo';
  final String userLocation = 'Quận 10, TP.HCM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header
          HeaderWidget(userName: userName, userLocation: userLocation),
          // Nội dung bên dưới header
          Expanded(child: IndexedStack(index: myIndex, children: screens)),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: myIndex,
        backgroundColor: Colors.white,
        color: const Color.fromARGB(255, 167, 169, 212),
        items: const <Widget>[
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
      ),
    );
  }
}
