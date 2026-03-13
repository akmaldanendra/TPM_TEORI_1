import 'package:flutter/material.dart';

// Import halamannya
import 'ganjil_genap_page.dart';
import 'tambah_kurang_page.dart';
import 'piramid_page.dart';
import 'stopwatch.dart';
import 'total_angka_page.dart';
import 'login_page.dart'; // Import halaman login untuk fitur logout

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Utama', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2563EB), // Warna utama
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        // --- MENAMBAHKAN TOMBOL LOGOUT DI KANAN ATAS ---
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              // Arahkan ke halaman login dan hapus riwayat halaman (biar nggak bisa di-back)
              // Jika merah, sesuaikan "LoginPage()" dengan nama class asli di file login_page.dart
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginPage()),
                (Route<dynamic> route) => false,
              );
            },
          ),
          const SizedBox(width: 8), // Memberikan sedikit jarak dari tepi kanan layar
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            const SizedBox(height: 10),
            
            // --- HEADER DATA KELOMPOK ---
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xFF2563EB).withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF1E293B).withOpacity(0.06),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  )
                ]
              ),
              child: Column(
                children: [
                  const Text(
                    "ANGGOTA KELOMPOK",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18, 
                      color: Color(0xFF2563EB), 
                    )
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "Mohammad Atilla Danadyaksa (123230134)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF1E293B))
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Akmal Danendra Maulana (123230135)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF1E293B))
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Hafiz Alaudin Rasendriya (123230149)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF1E293B))
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Dida Attallah Elfasdi (123230145)",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13, color: Color(0xFF1E293B))
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40), 
            
            // --- JUDUL BAGIAN FITUR ---
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Pilih Fitur',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Color(0xFF1E293B)),
              ),
            ),
            const SizedBox(height: 16),

            // --- GRID MENU FITUR ---
            Wrap(
              alignment: WrapAlignment.center, 
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildMenuCard(context, 'Menu 1', 'Ganjil Genap & Prima', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => GanjilGenapPage()));
                }),
                _buildMenuCard(context, 'Menu 2', 'Kalkukator Tambah Kurang', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TambahKurangPage()));
                }),
                _buildMenuCard(context, 'Menu 3', 'Luas & Volume Piramid', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PiramidPage()));
                }),
                _buildMenuCard(context, 'Menu 4', 'Total Angka', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TotalAngkaPage()));
                }),
                _buildMenuCard(context, 'Menu 5', 'Stopwatch', () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => StopwatchPage()));
                }),
              ],
            )
          ],
        ),
      ),
    );
  }

  // Widget _buildMenuCard tidak ada perubahan
  Widget _buildMenuCard(BuildContext context, String menuNumber, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: (MediaQuery.of(context).size.width / 2) - 28, 
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              menuNumber, 
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.grey),
            ),
            const SizedBox(height: 8),
            Text(
              title, 
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Color(0xFF2563EB)),
            ),
          ],
        ),
      ),
    );
  }
}