import 'package:flutter/material.dart';
import 'package:login_screens/util/util.dart';

class LoginScreen1 extends StatefulWidget {
  const LoginScreen1({super.key});

  @override
  LoginStateScreen1 createState() => LoginStateScreen1();
}

class LoginStateScreen1 extends State<LoginScreen1> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String? _emptyEmail = null;
  String? _emptyPassword = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 100,
              child: Center(
                  child: getTitleFormated(
                      title: 'APP',
                      subtitle: 'Name',
                      colorText: Colors.blue.withOpacity(0.8),
                      biggest: true)),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                hintStyle: const TextStyle(color: Colors.black54),
                errorText: _emptyEmail,
              ),
            ),
            const SizedBox(height: 12.0),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: InputDecoration(
                hintText: 'Password',
                labelText: 'Password',
                hintStyle: const TextStyle(color: Colors.black54),
                errorText: _emptyPassword,
              ),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {},
              child: const Text('Forgot password?'),
            ),
          ],
        ),
      ),
    );
  }
}
