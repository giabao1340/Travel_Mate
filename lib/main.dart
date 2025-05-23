// lib/main.dart
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_mate/config/app_routes.dart';
import 'package:travel_mate/core/widgets/header_widget.dart';
import 'package:travel_mate/modules/home/screens/favorite_screen.dart';
import 'package:travel_mate/modules/home/screens/home_content_screen.dart';
import 'package:travel_mate/modules/home/screens/lists_creen.dart';
import 'package:travel_mate/modules/home/screens/place_details_screen.dart';
import 'package:travel_mate/modules/intro/screens/introscreen.dart';
import 'package:travel_mate/modules/profile/ui/profile_screen.dart';
import 'package:travel_mate/modules/search/screens/search_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final app = await Firebase.initializeApp();
  // ignore: avoid_print
  print("Firebase connected: ${app.name}");
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
      home: FirebaseAuth.instance.currentUser != null
          ? const HomeScreen()
          : const IntroScreen(), // 👈 kiểm tra trạng thái,
      routes: appRoutes,
      
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
    PlaceDetailsScreen(),
  ];

  final String userName = 'Gia Bảo';
  final String userLocation = 'Quận 10, TP.HCM';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          if (myIndex < 4)
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
