import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobile_office/admin_auth/Adminlogin_screen.dart';
import 'package:mobile_office/screens/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  User? user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: user == null ? _buildLoginForm() : const HomePage(),
      ),
    );
  }

  Widget _buildLoginForm() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Employee Log In'),
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
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Email'),
                    validator: (text) {
                      if (text!.isEmpty ||
                          !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                              .hasMatch(text)) {
                        return 'Enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
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
                        onPressed: () async {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                          setState(() {
                            user = FirebaseAuth.instance.currentUser;
                          });
                        },
                        child: const Text('continue'),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      // ElevatedButton(
                      //   onPressed: () {},
                      //   child: const Icon(Icons.email),
                      // ),
                      // const SizedBox(
                      //   width: 15,
                      // ),
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
}
