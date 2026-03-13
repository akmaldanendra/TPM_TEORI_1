import 'dart:math';
import 'package:flutter/material.dart';

class PiramidPage extends StatefulWidget {
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
          content: Text('Isi dlu panjang sisi sama tingginye bos!'), 
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
      appBar: AppBar(title: Text('Luas & Volume Piramid')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Box Hasil
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              child: Column(
                children: [
                  Text('Hasil Perhitungan (Alas Persegi):', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Luas Permukaan', style: TextStyle(color: Colors.grey)),
                          Text(
                            _hasilLuas,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Volume', style: TextStyle(color: Colors.grey)),
                          Text(
                            _hasilVolume,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _sisiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Panjang Sisi Alas',
                prefixIcon: Icon(Icons.square_foot),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _tinggiController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Tinggi Piramid',
                prefixIcon: Icon(Icons.height),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _hitungPiramid,
              child: Text('Hitung Sekarang', style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}