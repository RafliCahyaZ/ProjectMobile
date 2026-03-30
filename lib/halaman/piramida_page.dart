import 'package:flutter/material.dart';

class PiramidaPage extends StatefulWidget {
  const PiramidaPage({super.key});

  @override
  State<PiramidaPage> createState() => _PiramidaPageState();
}

class _PiramidaPageState extends State<PiramidaPage> {
  final sisi = TextEditingController();
  final tinggi = TextEditingController();
  String hasil = "";

  void hitung() {
    double s = double.parse(sisi.text);
    double t = double.parse(tinggi.text);

    double volume = (1 / 3) * (s * s) * t;
    double luas = s * s + 2 * s * t;

    setState(() {
      hasil = "Volume: $volume\nLuas: $luas";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Piramida")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: sisi, decoration: const InputDecoration(labelText: "Sisi")),
            TextField(controller: tinggi, decoration: const InputDecoration(labelText: "Tinggi")),
            ElevatedButton(onPressed: hitung, child: const Text("Hitung")),
            Text(hasil)
          ],
        ),
      ),
    );
  }
}