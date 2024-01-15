import 'package:flutter/material.dart';
import 'package:flutter_weather/src/ui/components/navbar.dart';
import 'package:flutter_weather/src/view_models/login_viewmodel.dart';
import 'package:provider/provider.dart'; // Import your LoginViewModel

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      
      //viewModel.logIn(email.text, password.text, context);
    });
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff28227f),
      ),
      bottomNavigationBar: navbar(context, 2),
      backgroundColor: const Color(0xff28227f),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(
                  height: 200,
                  child: Image(image: AssetImage("assets/images/CLOUDS.png"))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    filled: true,
                    hintStyle: TextStyle(color: Colors.grey[600]),
                    hintText: "Email",
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
              ElevatedButton(
                onPressed: () {
                  LoginViewModel viewModel =
                      Provider.of<LoginViewModel>(context, listen: false);
                  viewModel.logIn(email.text, password.text, context);
                },
                child: const Text("Login"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account "),
                  TextButton(
                    onPressed: () {
                      LoginViewModel viewModel =
                          Provider.of<LoginViewModel>(context, listen: false);
                      viewModel.goToSignUp(context);
                    },
                    child: const Text("Sign Up"),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
