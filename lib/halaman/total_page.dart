import 'package:flutter/material.dart';

class TotalPage extends StatefulWidget {
  const TotalPage({super.key});

  @override
  State<TotalPage> createState() => _TotalPageState();
}

class _TotalPageState extends State<TotalPage> {
  final input = TextEditingController();
  String hasil = "";

  void hitung() {
    List<String> angka = input.text.split(",");
    int total = 0;
    for (var a in angka) {
      total += int.parse(a.trim());
    }
    setState(() {
      hasil = total.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Total Angka")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: input,
              decoration: const InputDecoration(labelText: "Pisahkan dengan koma (1,2,3)"),
            ),
            ElevatedButton(onPressed: hitung, child: const Text("Hitung")),
            Text("Total: $hasil")
          ],
        ),
      ),
    );
  }
}