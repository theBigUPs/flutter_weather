import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff28227f),
      ),
      bottomNavigationBar: navbar(context, 2),
      backgroundColor: const Color(0xff28227f),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Image(image: AssetImage("assets/images/CLOUDS.png")),
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Login")),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
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
