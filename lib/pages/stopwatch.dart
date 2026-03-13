import 'dart:async';
import 'dart:ui'; // Penting untuk FontFeature
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  _StopwatchPageState createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  late Stopwatch _stopwatch;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
  }

  void _startTimer() {
    // Panggil setState tiap 30 milidetik biar angka milidetiknye muter terus
    _timer = Timer.periodic(const Duration(milliseconds: 30), (Timer t) {
      if (mounted) {
        setState(() {});
      }
    });
    _stopwatch.start();
  }

  void _stopTimer() {
    _timer.cancel();
    _stopwatch.stop();
    setState(() {});
  }

  void _resetTimer() {
    if (_stopwatch.isRunning) {
      _timer.cancel();
    }
    _stopwatch.reset();
    setState(() {});
  }

  String _formatTime() {
    var milli = _stopwatch.elapsedMilliseconds;
    // Potong milidetik jadi 2 digit aje biar kaga kepanjangan
    String milliseconds = (milli % 1000).toString().padLeft(3, "0").substring(0, 2);
    String seconds = ((milli ~/ 1000) % 60).toString().padLeft(2, "0");
    String minutes = ((milli ~/ 1000) ~/ 60).toString().padLeft(2, "0");

    return "$minutes:$seconds:$milliseconds";
  }

  @override
  void dispose() {
    // Matiin timer kalo halamannya diclose biar memory lu kaga bocor
    if (_stopwatch.isRunning) {
      _timer.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC), // Warna background senada
      appBar: AppBar(
        title: const Text('Stopwatch', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF2563EB), // Warna biru utama
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView( // Ditambah SingleChildScrollView biar gak error kalau layarnya kecil
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // --- LAYAR TIMER ---
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
                decoration: BoxDecoration(
                  color: Colors.white, // Dibungkus kotak putih
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xFF1E293B).withOpacity(0.06),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    )
                  ],
                  border: Border.all(color: const Color(0xFFE2E8F0)), // Border tipis
                ),
                child: Column(
                  children: [
                    Text('Waktu Berjalan', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[600])),
                    const SizedBox(height: 16),
                    Text(
                      _formatTime(),
                      style: const TextStyle(
                        fontSize: 64, 
                        fontWeight: FontWeight.bold, 
                        color: Color(0xFF2563EB), // Biru Utama
                        fontFeatures: [FontFeature.tabularFigures()], // Biar angkanya kaga goyang-goyang pas jalan
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 60),
              
              // --- TOMBOL-TOMBOL KONTROL ---
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Tombol Play
                  _buildControlButton(
                    onPressed: _stopwatch.isRunning ? null : _startTimer,
                    icon: Icons.play_arrow,
                    color: Colors.green.shade600,
                  ),
                  
                  // Tombol Pause
                  _buildControlButton(
                    onPressed: _stopwatch.isRunning ? _stopTimer : null,
                    icon: Icons.pause,
                    color: Colors.orange.shade600,
                  ),
                  
                  // Tombol Stop/Reset
                  _buildControlButton(
                    onPressed: _resetTimer,
                    icon: Icons.stop,
                    color: Colors.red.shade600,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget khusus untuk membuat tombol bulat agar kodenya lebih rapi
  Widget _buildControlButton({required VoidCallback? onPressed, required IconData icon, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: onPressed == null 
          ? [] // Gak ada bayangan kalau tombolnya mati (disabled)
          : [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 12,
                offset: const Offset(0, 6),
              )
            ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(20), // Ukuran tombol diperbesar sedikit
          backgroundColor: color,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey.shade300,
          disabledForegroundColor: Colors.grey.shade500,
          shape: const CircleBorder(),
          elevation: 0, // Elevation dari button dimatikan, diganti pakai boxShadow dari Container di atas
        ),
        child: Icon(icon, size: 36),
      ),
    );
  }
}