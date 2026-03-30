import 'package:flutter/material.dart';
import '../models/kelompok.dart';

class KelompokPage extends StatelessWidget {
  const KelompokPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Kelompok> dataKelompok = [
      Kelompok(nama: "Rafli", nim: "123230214"),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Data Kelompok")),
      body: ListView.builder(
        itemCount: dataKelompok.length,
        itemBuilder: (context, index) {
          final data = dataKelompok[index];
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text(data.nama),
            subtitle: Text("NIM: ${data.nim}"),
          );
        },
      ),
    );
  }
}