import 'package:flutter/material.dart';

class TotalAngkaPage extends StatefulWidget {
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
          content: Text('Isi dlu field-nye bos, kaga ada yang bisa diitung nih!'), 
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
      appBar: AppBar(title: Text('Total Angka di Field')),
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
                  Text('Hasil Kalkulasi:', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Banyak Digit', style: TextStyle(color: Colors.grey)),
                          Text(
                            _banyakAngka,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Total Jumlah', style: TextStyle(color: Colors.grey)),
                          Text(
                            _hasilTotal,
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
              controller: _angkaController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Masukin Deretan Angka (Misal: 1234)',
                prefixIcon: Icon(Icons.calculate),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _hitungTotal,
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