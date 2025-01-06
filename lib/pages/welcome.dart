import 'package:flutter/material.dart';
// import 'package:flutter_cs_in_lab_project/pages/next_welcome.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  String _chat = '';
  final TextEditingController _controller = TextEditingController();

  void sayHi() {
    String input_text = _controller.text;
    setState(() {
      _chat = 'User: $input_text';
    });
  }

  @override
  void initState() {
    super.initState();
    _chat = 'Waiting Chat...';
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigator.pushReplacement // Replace Current Page
                  // Navigator.pushAndRemoveUntil // Remove All in Stack
                  // Navigator.pushAndRemoveUntil(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => NextWelcome(
                  //       name: _controller.text,
                  //     test_number: 19,
                  //     ),
                  //   ),
                  //   (route) => false,
                  // );
                  Navigator.pushNamed(
                    context,
                    '/next_welcome',
                    arguments: {
                      'name': _controller.text,
                    },
                  );
                },
                child: const Text('Next Page'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
