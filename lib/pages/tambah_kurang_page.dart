import 'package:flutter/material.dart';

class TambahKurangPage extends StatefulWidget {
  const TambahKurangPage({super.key});

  @override
  _TambahKurangPageState createState() => _TambahKurangPageState();
}

class _TambahKurangPageState extends State<TambahKurangPage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = "0";

  void _hitung(String operasi) {
    // Validasi kalo inputannye kosong
    if (_angka1Controller.text.isEmpty || _angka2Controller.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi dulu angkanya, tidak boleh kosong!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    double angka1 = double.tryParse(_angka1Controller.text) ?? 0;
    double angka2 = double.tryParse(_angka2Controller.text) ?? 0;
    double hasil;

    if (operasi == '+') {
      hasil = angka1 + angka2;
    } else {
      hasil = angka1 - angka2;
    }

    setState(() {
      // Biar kalo hasilnye gaada koma (misal 5.0), ditampilinnye 5 aje biar cakep
      if (hasil == hasil.toInt()) {
        _hasil = hasil.toInt().toString();
      } else {
        _hasil = hasil.toString();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Warna background senada
      appBar: AppBar(
        title: const Text('Kalkulator Tambah Kurang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
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
                  crossAxisAlignment: CrossAxisAlignment.end, // Teks rata kanan seperti kalkulator
                  children: [
                    Text('Hasil Akhir', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[600])),
                    const SizedBox(height: 8),
                    Text(
                      _hasil,
                      style: const TextStyle(
                        fontSize: 48, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFF2563EB), // Menggunakan warna biru utama untuk hasil
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              
              // --- FORM INPUT ANGKA 1 ---
              TextField(
                controller: _angka1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka Pertama',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.looks_one, color: Color(0xFF2563EB)),
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
              
              // --- FORM INPUT ANGKA 2 ---
              TextField(
                controller: _angka2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Angka Kedua',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.looks_two, color: Color(0xFF2563EB)),
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
              const SizedBox(height: 40),
              
              // --- TOMBOL OPERASI (+ DAN -) ---
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _hitung('+'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2563EB), // Biru utama
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                      ),
                      child: const Icon(Icons.add, size: 28),
                    ),
                  ),
                  const SizedBox(width: 16), // Jarak antar tombol
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => _hitung('-'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade600, // Merah untuk kurang
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                      ),
                      child: const Icon(Icons.remove, size: 28),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}