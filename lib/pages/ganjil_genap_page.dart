import 'package:flutter/material.dart';

class GanjilGenapPage extends StatefulWidget {
  const GanjilGenapPage({super.key});

  @override
  _GanjilGenapPageState createState() => _GanjilGenapPageState();
}

class _GanjilGenapPageState extends State<GanjilGenapPage> {
  final TextEditingController _angkaController = TextEditingController();
  String _hasilGanjilGenap = "-";
  String _hasilPrima = "-";
  bool _sudahDihitung = false;

  void _cekAngka() {
    if (_angkaController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Isi dulu angkanya, tidak boleh kosong!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    int? angka = int.tryParse(_angkaController.text);
    if (angka == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Masukkan angka bulat saja!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _sudahDihitung = true;

      // Logika Ganjil Genap
      if (angka % 2 == 0) {
        _hasilGanjilGenap = "GENAP";
      } else {
        _hasilGanjilGenap = "GANJIL";
      }

      // Logika Bilangan Prima
      bool isPrima = true;
      if (angka <= 1) {
        isPrima = false;
      } else {
        for (int i = 2; i <= angka / 2; i++) {
          if (angka % i == 0) {
            isPrima = false;
            break;
          }
        }
      }

      if (isPrima) {
        _hasilPrima = "PRIMA";
      } else {
        _hasilPrima = "BUKAN PRIMA";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Warna background senada
      appBar: AppBar(
        title: const Text('Ganjil Genap & Prima', style: TextStyle(fontWeight: FontWeight.bold)),
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
                  color: const Color(0xFFF1F5F9), // Warna abu-abu yang lebih lembut dari sebelumnya
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE2E8F0)), // Border lebih tipis dan terang
                ),
                child: Column(
                  children: [
                    Text('Hasil Analisis Angka', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.grey[600])),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            const Text('Tipe', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(
                              _hasilGanjilGenap,
                              style: TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold, 
                                color: _hasilGanjilGenap == "GENAP" ? const Color(0xFF2563EB) : Colors.orange.shade700,
                              ),
                            ),
                          ],
                        ),
                        Container(height: 40, width: 1, color: Colors.grey.shade300), // Garis pemisah kecil di tengah
                        Column(
                          children: [
                            const Text('Status', style: TextStyle(color: Colors.grey, fontSize: 12)),
                            const SizedBox(height: 4),
                            Text(
                              _hasilPrima,
                              style: TextStyle(
                                fontSize: 20, 
                                fontWeight: FontWeight.bold, 
                                color: _hasilPrima == "PRIMA" ? Colors.green.shade600 : Colors.red.shade600,
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
                  labelText: 'Masukkan Angka Bulat',
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  prefixIcon: const Icon(Icons.numbers, color: Color(0xFF2563EB)),
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
              
              // --- TOMBOL CEK ---
              ElevatedButton(
                onPressed: _cekAngka,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB), // Warna biru utama
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 2,
                ),
                child: const Text('Cek Sekarang', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}