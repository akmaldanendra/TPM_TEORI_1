import 'package:flutter/material.dart';

class GanjilGenapPage extends StatefulWidget {
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
          content: Text('Isi dlu angkanye bos, kosong blong gitu!'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    int? angka = int.tryParse(_angkaController.text);
    if (angka == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Masukin angka bulat aje, kaga usah pake koma atau huruf!'),
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
      appBar: AppBar(title: Text('Cek Ganjil Genap & Prima')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            // Box Hasilnye nih
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
                  Text('Hasil Analisis Angka:', style: TextStyle(fontSize: 16, color: Colors.grey[700])),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Tipe', style: TextStyle(color: Colors.grey)),
                          Text(
                            _hasilGanjilGenap,
                            style: TextStyle(
                              fontSize: 24, 
                              fontWeight: FontWeight.bold, 
                              color: _hasilGanjilGenap == "GENAP" ? Colors.blue : Colors.orange,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Status', style: TextStyle(color: Colors.grey)),
                          Text(
                            _hasilPrima,
                            style: TextStyle(
                              fontSize: 24, 
                              fontWeight: FontWeight.bold, 
                              color: _hasilPrima == "PRIMA" ? Colors.green : Colors.red,
                            ),
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
                labelText: 'Masukin Angka Bulat',
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: _cekAngka,
              child: Text('Cek Sekarang', style: TextStyle(fontSize: 16)),
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