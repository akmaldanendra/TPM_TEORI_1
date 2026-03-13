import 'package:flutter/material.dart';

class TambahKurangPage extends StatefulWidget {
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
          content: Text('Isi dlu angkanye bos, mau ngitung angin lu?'),
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
      appBar: AppBar(title: Text('Kalkulator Tipis-Tipis')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Box buat nampilin hasil, ala-ala layar kalkulator
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Hasil:', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  Text(
                    _hasil,
                    style: TextStyle(
                      fontSize: 48, 
                      fontWeight: FontWeight.bold, 
                      color: Colors.blueGrey
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 40),
            TextField(
              controller: _angka1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Pertama',
                prefixIcon: Icon(Icons.looks_one),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _angka2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka Kedua',
                prefixIcon: Icon(Icons.looks_two),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _hitung('+'),
                  child: Icon(Icons.add, size: 32),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                ),
                ElevatedButton(
                  onPressed: () => _hitung('-'),
                  child: Icon(Icons.remove, size: 32),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}