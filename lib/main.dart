import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Import package-nya

// Import halaman home kamu
import 'pages/home_page.dart'; 

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi TPM Kelompok 8',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2563EB)),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC), // Warna latar belakang global
        // Terapkan font Outfit ke seluruh aplikasi
        textTheme: GoogleFonts.outfitTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const HomePage(),
    );
  }
}