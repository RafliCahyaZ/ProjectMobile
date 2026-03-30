import 'package:flutter/material.dart';
import 'dart:async';

class StopwatchPage extends StatefulWidget {
  const StopwatchPage({super.key});

  @override
  State<StopwatchPage> createState() => _StopwatchPageState();
}

class _StopwatchPageState extends State<StopwatchPage> {
  int detik = 0;
  Timer? timer;
  bool isRunning = false;

  void start() {
    if (isRunning) return; // biar tidak double timer

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {
        detik++;
      });
    });

    isRunning = true;
  }

  void stop() {
    timer?.cancel();
    isRunning = false;
  }

  void reset() {
    timer?.cancel();
    setState(() {
      detik = 0;
    });
    isRunning = false;
  }

  String formatWaktu(int detik) {
    int jam = detik ~/ 3600;
    int menit = (detik % 3600) ~/ 60;
    int sisaDetik = detik % 60;

    return "${jam.toString().padLeft(2, '0')}:"
           "${menit.toString().padLeft(2, '0')}:"
           "${sisaDetik.toString().padLeft(2, '0')}";
  }

  @override
  void dispose() {
    timer?.cancel(); // penting biar tidak bocor memori
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Stopwatch")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            formatWaktu(detik),
            style: const TextStyle(fontSize: 40),
          ),
          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: start, child: const Text("Start")),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: stop, child: const Text("Stop")),
              const SizedBox(width: 10),
              ElevatedButton(onPressed: reset, child: const Text("Reset")),
            ],
          )
        ],
      ),
    );
  }
}