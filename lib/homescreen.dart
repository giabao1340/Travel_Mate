import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Location 1'),
            subtitle: const Text('Description of Location 1'),
            onTap: () {
              // Thêm logic điều hướng đến chi tiết địa điểm
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Location 2'),
            subtitle: const Text('Description of Location 2'),
            onTap: () {
              // Thêm logic điều hướng đến chi tiết địa điểm
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.place),
            title: const Text('Location 3'),
            subtitle: const Text('Description of Location 3'),
            onTap: () {
              // Thêm logic điều hướng đến chi tiết địa điểm
            },
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // index: 1,
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 167, 169, 212),
        // color: const Color.fromARGB(255, 123, 142, 191),
        items: [
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}
