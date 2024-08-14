import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:suitmediates/pages/first_page.dart';

import 'user_provider.dart'; // Import provider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) =>
          UserProvider(), // Provide the UserProvider to the app
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstPage(),
    );
  }
}
