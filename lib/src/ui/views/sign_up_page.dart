import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
import 'package:flutter_weather/src/view_models/sign_up_viewmodel.dart';
import 'package:provider/provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();
    final TextEditingController passwordAgain = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff28227f),
      ),
      bottomNavigationBar: navbar(context, 2),
      backgroundColor: const Color(0xff28227f),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                  height: 200,
                  child: Image(image: AssetImage("assets/images/SNOW.png"))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "Password",
                    fillColor: Colors.white70,
                  ),
                  controller: email,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "Password",
                    fillColor: Colors.white70,
                  ),
                  controller: password,
                ),
              ),
              
              ElevatedButton(onPressed: () {}, child: const Text("Register")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("have an account ?"),
                  TextButton(
                      onPressed: () {
                        SignUpViewModel viewModel =
                            Provider.of<SignUpViewModel>(context,
                                listen: false);
                        viewModel.goToSignUp(context);
                      },
                      child: const Text("Login")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
