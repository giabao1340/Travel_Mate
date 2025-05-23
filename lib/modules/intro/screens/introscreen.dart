import 'package:flutter/material.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreen1State();
}

class _IntroScreen1State extends State<IntroScreen> {
  late PageController _pageController;
  int _active = 0; // ✅ Đưa active vào trong State

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _active);
  }

  List<Map<String, String>> get splashData => [
    {"image": "assets/splashscreen1.png"},
    {"text": "Discover new places", "image": "assets/splashscreen2.png"},
    {"image": "assets/splashscreen3.png"},
    {"image": "assets/splashscreen4.png"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [_buildPageView(), _buildBottomNavigation()],
      ),
    );
  }

  Widget _buildPageView() {
    return PageView.builder(
      onPageChanged: (value) {
        setState(() {
          _active = value;
        });
      },
      controller: _pageController,
      itemCount: splashData.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(splashData[index]["image"]!, fit: BoxFit.cover),
            const SizedBox(height: 20),
          ],
        );
      },
    );
  }

  Widget _buildBottomNavigation() {
    return Positioned(
      bottom: 50,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/login');
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 128, 120, 218),
              ),
            ),
          ),
          _buildDotsIndicator(),
          TextButton(
            onPressed: () {
              if (_active == splashData.length - 1) {
                Navigator.pushNamed(context, '/login');
              } else {
                _pageController.nextPage(
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.linearToEaseOut,
                );
              }
            },
            child: Text(
              _active == splashData.length - 1 ? 'Login' : 'Next',
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 128, 120, 218),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      children: List.generate(splashData.length, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: _active == index ? 16 : 8,
          height: 8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color:
                _active == index
                    ? const Color.fromARGB(255, 128, 120, 218)
                    : const Color.fromARGB(255, 193, 193, 193),
          ),
        );
      }),
    );
  }
}
