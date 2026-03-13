import 'package:flutter/material.dart';
import 'login_page.dart';
import 'tambah_kurang_page.dart';
import 'ganjil_genap_page.dart';
import 'total_angka_page.dart';
import 'stopwatch.dart';
import 'piramid_page.dart';
import 'kelompok_page.dart';

class HomePage extends StatelessWidget {
  // Bikin list menu sesuai tugas lu ye
  final List<Map<String, dynamic>> menuTugas = [
    {'title': 'Data Kelompok', 'icon': Icons.group},
    {'title': 'Penjumlahan & Pengurangan', 'icon': Icons.calculate},
    {'title': 'Ganjil/Genap & Prima', 'icon': Icons.numbers},
    {'title': 'Total Angka di Field', 'icon': Icons.format_list_numbered},
    {'title': 'Stopwatch', 'icon': Icons.timer},
    {'title': 'Luas & Volume Piramid', 'icon': Icons.architecture},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Tugas Modul 4'),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: menuTugas.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            elevation: 3,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(menuTugas[index]['icon'], size: 32, color: Colors.blueGrey),
              ),
              title: Text(
                menuTugas[index]['title'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
              onTap: () {
  if (menuTugas[index]['title'] == 'Data Kelompok') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => KelompokPage()));
  } else if (menuTugas[index]['title'] == 'Penjumlahan & Pengurangan') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TambahKurangPage()));
  } else if (menuTugas[index]['title'] == 'Ganjil/Genap & Prima') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GanjilGenapPage()));
  } else if (menuTugas[index]['title'] == 'Total Angka di Field') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TotalAngkaPage()));
  } else if (menuTugas[index]['title'] == 'Stopwatch') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => StopwatchPage()));
  } else if (menuTugas[index]['title'] == 'Luas & Volume Piramid') {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PiramidPage()));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sabar, halaman ${menuTugas[index]['title']} belom dibikin pak!')),
    );
  }
},
            ),
          );
        },
      ),
    );
  }
}