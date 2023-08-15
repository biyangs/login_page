
import 'package:flutter/material.dart';
import 'login_area/sign_in.dart';
import 'login_area/sign_up.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
        const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Myscaffold(),
    );
  }
}

class Myscaffold extends StatelessWidget {
  const Myscaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: LoginForm(),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  String email = '';
  String password = '';

  void _login() {
    // Placeholder for authentication logic
    print('$email'+'$password');
    if ((email == 'admin' )&&( password == 'admin')) {
      Navigator.push(context,
        MaterialPageRoute(builder: (context) => SignInPage())
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextField(
          onChanged: (value) {
            setState(() {
              email = value;
            });
          },
          decoration: const InputDecoration(
            labelText: 'username',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        TextField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: true, // Hide the password
          decoration: const InputDecoration(
            labelText: 'Password',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: _login,
          child: const Text('Login'),
        ),
        const SizedBox(height: 1),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: const Text("Don't Have an account yet?"),
        ),
        const SizedBox(height: 5),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUpPage()),
            );
          },
          child: const Text('Continue with google'),
        ),
      ],
    );
  }
}

