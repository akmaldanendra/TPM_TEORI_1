import 'package:flutter/material.dart';

class KelompokPage extends StatelessWidget {
  // Udah gua masukin nih nama sama NIM kelompok lu ye
  final List<Map<String, String>> anggota = [
    {'nama': 'Mohammad Atilla Danadyaksa', 'nim': '123230134'},
    {'nama': 'Akmal Danendra Maulana', 'nim': '123230135'},
    {'nama': 'Hafiz Alaudin Rasendriya', 'nim': '1231230143'},
    {'nama': 'Dida Attallah Elfasdi', 'nim': '123230145'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Data Kelompok')),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: anggota.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 3,
            margin: EdgeInsets.symmetric(vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: EdgeInsets.all(16),
              leading: CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 24,
                child: Icon(Icons.person, color: Colors.white, size: 28),
              ),
              title: Text(
                anggota[index]['nama']!, 
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)
              ),
              subtitle: Text(
                'NIM: ${anggota[index]['nim']}',
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
          );
        },
      ),
    );
  }
}