import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String _chat = 'Waiting Chat...';
  final TextEditingController _controller = TextEditingController();

  void sayHi() {
    String input_text = _controller.text;
    setState(() {
      _chat = 'User: $input_text';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Welcome'),
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
              const Text("Hello"),
              Text(_chat),
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Type Here',
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  sayHi();
                },
                child: const Text('Say This'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
