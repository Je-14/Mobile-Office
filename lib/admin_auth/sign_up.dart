import 'package:flutter/material.dart';
import 'package:mobile_office/screens/adminHome.dart';

class AdminSignupScreen extends StatefulWidget {
  const AdminSignupScreen({Key? key}) : super(key: key);

  @override
  _AdminSignupScreenState createState() => _AdminSignupScreenState();
}

class _AdminSignupScreenState extends State<AdminSignupScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool loggedIn = false;
  String name = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Screen'),
      ),
      body: Container(
        color: Colors.amber[300],
        child: Center(
          child: loggedIn ? const AdminHome() : _buildSignupForm(),
        ),
      ),
    );
  }

  Widget _buildSignupForm() {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'username'),
              validator: (text) =>
                  text!.isEmpty || !RegExp(r'^[a-z A-Z 0-9]+$').hasMatch(text)
                      ? 'Enter valid username. '
                      : null,
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'email',
                fillColor: Colors.white,
              ),
              validator: (text) {
                if (text!.isEmpty ||
                    !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                        .hasMatch(text)) {
                  return 'Enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: 'password'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Please enter Password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              keyboardType: TextInputType.visiblePassword,
              decoration: const InputDecoration(labelText: 'Confirm password'),
              validator: (text) {
                if (text!.isEmpty) {
                  return 'Password does not match';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: _validate,
              child: const Text('continue'),
            ),
          ],
        ),
      ),
    );
  }

  void _validate() {
    final form = _formKey.currentState;
    if (!form!.validate()) {
      return;
    }
    setState(() {
      loggedIn = true;
      name = _nameController.text;
    });
  }

  Widget _buildSuccess() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check,
          color: Colors.orangeAccent,
        ),
        Text('Hi, $name')
      ],
    );
  }
}
