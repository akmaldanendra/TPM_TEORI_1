import 'package:flutter/material.dart';

class TotalAngkaPage extends StatefulWidget {
  const TotalAngkaPage({super.key});

  @override
  _TotalAngkaPageState createState() => _TotalAngkaPageState();
}

class _TotalAngkaPageState extends State<TotalAngkaPage> {
  final TextEditingController _angkaController = TextEditingController();
  String _hasilTotal = "0";
  String _banyakAngka = "0";

  void _hitungTotal() {
    String input = _angkaController.text;

    if (input.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi dulu field-nya ya, tidak ada yang bisa dihitung nih!'), 
          backgroundColor: Colors.red
        ),
      );
      return;
    }

    int totalJumlah = 0;
    int jumlahKarakter = 0;

    // Looping sesimple mungkin biar gampang dijelasin ntar pas presentasi
    for (int i = 0; i < input.length; i++) {
      // Cek satu-satu karakternye, bisa dijadiin angka apa kaga
      int? angka = int.tryParse(input[i]);
      
      if (angka != null) {
        totalJumlah += angka; // Tambahin angkanye ke total
        jumlahKarakter++;     // Itung ada berapa digit angkanye
      }
    }

    setState(() {
      _banyakAngka = jumlahKarakter.toString();
      _hasilTotal = totalJumlah.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Warna background senada
      appBar: AppBar(
        title: const Text('Total Angka', style: TextStyle(fontWeight: FontWeight.bold)),
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
                    Text('Hasil Kalkulasi', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[600])),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Banyak Digit', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(
                              _banyakAngka,
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
                            const Text('Total Jumlah', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(
                              _hasilTotal,
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
              
              // --- FORM INPUT ANGKA ---
              TextField(
                controller: _angkaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Masukin Deretan Angka (Misal: 1234)',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.calculate, color: Color(0xFF2563EB)),
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
                onPressed: _hitungTotal,
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