import 'package:examcellapp/services/auth/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:examcellapp/views/Student/studenHome.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  late final TextEditingController _email;
  late final TextEditingController _password;

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _email,
                enableSuggestions: false,
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  hintText: 'email',
                ),
              ),
              TextField(
                controller: _password,
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: const InputDecoration(
                  hintText: 'password',
                ),
              ),
              TextButton(
                onPressed: () async {
                  final email = _email.text;
                  final password = _password.text;

                  final userC = await FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: email, password: password);

                  // User? user = await _auth.signInWithEmailAndPassword(
                  //     email, password);

                  if (userC != null) {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const StudentHome()));
                    // return const MyHomePage(title: 'Teacher');
                    // return const StudentHome();
                  }
                  print(userC);
                },
                child: const Text("LogIn"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
