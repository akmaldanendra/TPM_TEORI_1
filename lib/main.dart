import 'package:flutter/material.dart';
import 'pages/login_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Tugas Modul 4',
      debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.blueGrey, 
          foregroundColor: Colors.white,
          elevation: 4, 
        ),
      ),
      home: LoginPage(),
    );
  }
}