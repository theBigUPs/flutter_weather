import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController passwordAgain = TextEditingController();
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: const Color(0xff28227f),
      body: SafeArea(
        child: Column(
          children: [
            const Image(
                image: AssetImage("assets/images/weathericonsunnycloudy.png")),
            TextField(
              controller: email,
            ),
            TextField(
              controller: password,
            ),
            TextField(
              controller: passwordAgain,
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Register")),

            //const Text("Don't have an account "),
            //TextButton(onPressed: () {}, child: const Text("Register")),
          ],
        ),
      ),
    );
  }
}
