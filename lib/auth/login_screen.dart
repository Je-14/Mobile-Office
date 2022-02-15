import 'package:flutter/material.dart';
import 'package:mobile_office/screens/home.dart';
import '../admin_auth/login_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool loggedIn = false;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: loggedIn ? const HomePage() : _buildLoginForm(),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
      ),
      body: Container(
        color: Colors.amber[300],
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'username',
                      fillColor: Colors.yellow,
                    ),
                    validator: (text) => text!.isEmpty ||
                            !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(text)
                        ? 'Enter valid username. '
                        : null,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    decoration: const InputDecoration(labelText: 'password'),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return 'Enter correct Password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: _validate,
                        child: const Text('continue'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AdminLoginScreen(),
                            ),
                          );
                        },
                        child: const Text('Admin'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    setState(
      () {
        loggedIn = true;
        name = _nameController.text;
      },
    );
  }
}
