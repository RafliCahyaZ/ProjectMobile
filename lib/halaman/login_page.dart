import 'package:flutter/material.dart';
import 'home_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController user = TextEditingController();
  final TextEditingController pass = TextEditingController();

  LoginPage({super.key});

  void login(BuildContext context) {
    if (user.text == "rafli" && pass.text == "214") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => HomePage()),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Login gagal")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: user, decoration: const InputDecoration(labelText: "Username")),
            TextField(controller: pass, decoration: const InputDecoration(labelText: "Password")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () => login(context), child: const Text("Login"))
          ],
        ),
      ),
    );
  }
}