import 'package:flutter/material.dart';

class WetonPage extends StatefulWidget {
  const WetonPage({super.key});

  @override
  State<WetonPage> createState() => _WetonPageState();
}

class _WetonPageState extends State<WetonPage> {
  DateTime? selectedDate;
  String hasil = "";

  final List<String> hariList = [
    "Minggu", "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu"
  ];

  final List<int> neptuHari = [5, 4, 3, 7, 8, 6, 9];

  final List<String> pasaran = [
    "Legi", "Pahing", "Pon", "Wage", "Kliwon"
  ];

  final List<int> neptuPasaran = [5, 9, 7, 4, 8];

  void hitungWeton() {
  if (selectedDate == null) return;

  // Acuan lebih akurat
  DateTime baseDate = DateTime(2000, 1, 1); // Sabtu Legi
  int selisih = selectedDate!.difference(baseDate).inDays;

  // Hari Masehi (INI FIX)
  final List<String> hariList = [
    "Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"
  ];

  final List<int> neptuHari = [4, 3, 7, 8, 6, 9, 5];

  int indexHari = selectedDate!.weekday - 1;

  // Pasaran Jawa
  final List<String> pasaran = [
    "Legi", "Pahing", "Pon", "Wage", "Kliwon"
  ];

  final List<int> neptuPasaran = [5, 9, 7, 4, 8];

  int indexPasaran = selisih % 5;
  if (indexPasaran < 0) indexPasaran += 5;

  String hari = hariList[indexHari];
  String pasar = pasaran[indexPasaran];

  int totalNeptu = neptuHari[indexHari] + neptuPasaran[indexPasaran];

  setState(() {
    hasil = "$hari $pasar\nNeptu: $totalNeptu";
  });
}

  Future<void> pilihTanggal() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        hasil = "";
      });
    }
  }

  String formatTanggal(DateTime date) {
    return "${date.day}-${date.month}-${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cek Weton")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: pilihTanggal,
              child: const Text("Pilih Tanggal"),
            ),

            const SizedBox(height: 10),

            if (selectedDate != null)
              Text(
                "Tanggal: ${formatTanggal(selectedDate!)}",
                style: const TextStyle(fontSize: 16),
              ),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: hitungWeton,
              child: const Text("Cek Weton"),
            ),

            const SizedBox(height: 20),

            Text(
              hasil,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}