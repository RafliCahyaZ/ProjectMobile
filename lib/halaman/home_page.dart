import 'package:flutter/material.dart';
import 'kelompok_page.dart';
import 'hitung_page.dart';
import 'bilangan_page.dart';
import 'total_page.dart';
import 'stopwatch_page.dart';
import 'piramida_page.dart';
import 'weton_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Widget tombol(BuildContext context, String title, Widget page) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => page));
      },
      child: Text(title),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu Utama")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          tombol(context, "Data Kelompok", KelompokPage()),
          tombol(context, "Penjumlahan & Pengurangan", HitungPage()),
          tombol(context, "Bilangan Ganjil/Genap & Prima", BilanganPage()),
          tombol(context, "Total Angka", TotalPage()),
          tombol(context, "Stopwatch", StopwatchPage()),
          tombol(context, "Luas & Volume Piramida", PiramidaPage()),
          tombol(context, "Cek Weton", WetonPage()),
        ],
      ),
    );
  }
}