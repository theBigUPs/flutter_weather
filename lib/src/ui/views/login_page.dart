import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xff28227f),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(
                image: AssetImage("assets/images/weathericonsunnycloudy.png")),
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Login")),
            Row(
              children: [
                const Text("Don't have an account "),
                TextButton(onPressed: () {}, child: const Text("Sign Up"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
