import 'package:flutter/material.dart';

class HitungPage extends StatefulWidget {
  const HitungPage({super.key});

  @override
  State<HitungPage> createState() => _HitungPageState();
}

class _HitungPageState extends State<HitungPage> {
  final a = TextEditingController();
  final b = TextEditingController();
  String hasil = "";

  void tambah() {
    setState(() {
      hasil = (int.parse(a.text) + int.parse(b.text)).toString();
    });
  }

  void kurang() {
    setState(() {
      hasil = (int.parse(a.text) - int.parse(b.text)).toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hitung")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: a, decoration: const InputDecoration(labelText: "Angka 1")),
            TextField(controller: b, decoration: const InputDecoration(labelText: "Angka 2")),
            Row(
              children: [
                ElevatedButton(onPressed: tambah, child: const Text("+")),
                ElevatedButton(onPressed: kurang, child: const Text("-")),
              ],
            ),
            Text("Hasil: $hasil")
          ],
        ),
      ),
    );
  }
}