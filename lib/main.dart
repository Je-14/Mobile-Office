import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_office/auth/firebase_auth.dart';
import 'package:mobile_office/auth/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyD8Q2D-QODCNzXQfdbg_GHEyF-W1RPhXHc",
        authDomain: "mobo-office.firebaseapp.com",
        projectId: "mobo-office",
        storageBucket: "mobo-office.appspot.com",
        messagingSenderId: "603080721962",
        appId: "1:603080721962:web:ae4e703011d45e5161e553",
        measurementId: "G-XNL9D9C9XE"),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FireAuth>(
          create: (_) => FireAuth(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) => context.read<FireAuth>().authStateChanges,
          initialData: 'fer',
        ),
      ],
      child: MaterialApp(
        // darkTheme: ThemeData(
        //   brightness: Brightness.dark,
        // ),
        debugShowCheckedModeBanner: false,
        title: 'Mobile Office',
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          primarySwatch: Colors.red,
        ),
        home: const Home(),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber[300],
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'MOBILE OFFICE',
                        style: GoogleFonts.redressed(
                          textStyle: Theme.of(context).textTheme.headline4,
                          fontSize: 90,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(60),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Login',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                          ),
                        ),
                        IconButton(
                          iconSize: 30,
                          icon: const Icon(Icons.login, color: Colors.white),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        const Text('or'),
                        const SizedBox(
                          width: 40,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignupScreen(),
                              ),
                            );
                          },
                          child: const Text(
                            'SIGNUP',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fireUser = context.watch<User>();
    if (fireUser != null) {
      return const Text('Signed In');
    }
    return const Text('Not Signed In');
  }
}
