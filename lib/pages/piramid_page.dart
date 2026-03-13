import 'dart:math';
import 'package:flutter/material.dart';

class PiramidPage extends StatefulWidget {
  const PiramidPage({super.key});

  @override
  _PiramidPageState createState() => _PiramidPageState();
}

class _PiramidPageState extends State<PiramidPage> {
  final TextEditingController _sisiController = TextEditingController();
  final TextEditingController _tinggiController = TextEditingController();
  
  String _hasilVolume = "0";
  String _hasilLuas = "0";

  void _hitungPiramid() {
    if (_sisiController.text.isEmpty || _tinggiController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi dulu panjang sisi sama tingginya ya!'), 
          backgroundColor: Colors.red
        ),
      );
      return;
    }

    double sisi = double.tryParse(_sisiController.text) ?? 0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0;

    // Kalo lu ditanya, bilang aje "Ini logic volumenya pak: 1/3 * Luas Alas * Tinggi"
    double volume = (1 / 3) * (sisi * sisi) * tinggi;

    // Nyari tinggi miring pake pitagoras (setengah sisi alas kuadrat + tinggi kuadrat trus di-akar)
    double tinggiMiring = sqrt(pow((sisi / 2), 2) + pow(tinggi, 2));
    
    // Luas Permukaan = Luas Alas (sisi*sisi) + 4 * Luas Segitiga Tegak (1/2 * sisi * tinggiMiring)
    double luasPermukaan = (sisi * sisi) + (4 * (0.5 * sisi * tinggiMiring));

    setState(() {
      _hasilVolume = volume.toStringAsFixed(2); // Dibulatin 2 angka di blakang koma aje biar rapi
      _hasilLuas = luasPermukaan.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Warna background senada
      appBar: AppBar(
        title: const Text('Luas & Volume Piramid', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2563EB), // Warna biru utama
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          decoration: BoxDecoration(
            color: Colors.white, // Dibungkus kotak putih
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF1E293B).withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ]
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // --- BOX HASIL ---
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9), // Warna abu-abu yang lebih lembut
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)), // Border lebih tipis
                ),
                child: Column(
                  children: [
                    Text('Hasil Perhitungan (Alas Persegi)', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[600])),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Luas Permukaan', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(
                              _hasilLuas,
                              style: const TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold, 
                                color: Color(0xFF2563EB), // Biru utama
                              ),
                            ),
                          ],
                        ),
                        Container(height: 40, width: 1, color: Colors.grey.shade300), // Garis pemisah vertikal
                        Column(
                          children: [
                            const Text('Volume', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(
                              _hasilVolume,
                              style: const TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold, 
                                color: Color(0xFF2563EB), // Biru utama
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // --- FORM INPUT SISI ---
              TextField(
                controller: _sisiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Panjang Sisi Alas',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.square_foot, color: Color(0xFF2563EB)),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              
              // --- FORM INPUT TINGGI ---
              TextField(
                controller: _tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi Piramid',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.height, color: Color(0xFF2563EB)),
                  filled: true,
                  fillColor: Colors.grey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFF2563EB), width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 32),
              
              // --- TOMBOL HITUNG ---
              ElevatedButton(
                onPressed: _hitungPiramid,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB), // Warna biru utama
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                ),
                child: const Text('Hitung Sekarang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}