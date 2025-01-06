import 'package:flutter/material.dart';
// import 'package:flutter_cs_in_lab_project/pages/ev_cal.dart';
// import 'package:flutter_cs_in_lab_project/pages/home.dart';
import 'package:flutter_cs_in_lab_project/pages/welcome.dart';
import 'package:flutter_cs_in_lab_project/pages/next_welcome.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const Welcome(),
        '/next_welcome': (context) => NextWelcome(
              name: (ModalRoute.of(context)!.settings.arguments
                  as Map<String, dynamic>)['name'] as String,
            ),
      },
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          color: Color.fromARGB(255, 23, 137, 109),
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          iconTheme: IconThemeData(color: Colors.white),
        ),
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 23, 137, 109)),
      ),
      // home: const EVCal(),
      // home: const Welcome(),
    );
  }
}
