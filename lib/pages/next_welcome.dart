import 'package:flutter/material.dart';

class NextWelcome extends StatefulWidget {
  final String? name;
  const NextWelcome({super.key, required this.name});

  @override
  State<NextWelcome> createState() => _NextWelcomeState();
}

class _NextWelcomeState extends State<NextWelcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome Next'),
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
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              const Text("Username you input:"),
              Text("User: ${widget.name}"),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
