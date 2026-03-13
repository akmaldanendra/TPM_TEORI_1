import 'dart:async';
import 'package:flutter/material.dart';

class StopwatchPage extends StatefulWidget {
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
    _timer = Timer.periodic(Duration(milliseconds: 30), (Timer t) {
      setState(() {});
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
      appBar: AppBar(title: Text('Stopwatch')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Layar Angkanye nih
            Container(
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.blueGrey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.blueGrey, width: 2),
              ),
              child: Text(
                _formatTime(),
                style: TextStyle(
                  fontSize: 64, 
                  fontWeight: FontWeight.bold, 
                  color: Colors.blueGrey,
                  fontFeatures: [FontFeature.tabularFigures()], // Biar angkanya kaga goyang-goyang pas jalan
                ),
              ),
            ),
            SizedBox(height: 60),
            // Tombol-tombol kontrol
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? null : _startTimer,
                  child: Icon(Icons.play_arrow, size: 32),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: _stopwatch.isRunning ? _stopTimer : null,
                  child: Icon(Icons.pause, size: 32),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
                  ),
                ),
                ElevatedButton(
                  onPressed: _resetTimer,
                  child: Icon(Icons.stop, size: 32),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: CircleBorder(),
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