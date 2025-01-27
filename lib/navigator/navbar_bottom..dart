import 'package:flutter/material.dart';

class NavbarBottom extends StatefulWidget {
  const NavbarBottom({super.key});

  @override
  State<NavbarBottom> createState() => _NavbarBottomState();
}

class _NavbarBottomState extends State<NavbarBottom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Navbar Bottom'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('Search Tap');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              debugPrint('Notifications Tap');
            },
          ),
        ],
      ),
      // body:
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
        ],
      ),
    );
  }
}
