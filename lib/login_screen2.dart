import 'dart:math';

import 'package:flutter/material.dart';
import 'package:login_screens/main.dart';
import 'package:login_screens/util/util.dart';

class LoginScreen2 extends StatefulWidget {
  const LoginScreen2({super.key});

  @override
  LoginStateScreen2 createState() => LoginStateScreen2();
}

class LoginStateScreen2 extends State<LoginScreen2> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String? _emptyEmail = null;
  String? _emptyPassword = null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CirclesBackground(),
          Container(
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
                      biggest: true,
                    ),
                  ),
                ),
                const SizedBox(height: 80.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: themeColor.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor,
                        ),
                      ),
                      hintText: 'Email',
                      labelText: 'Email',
                      hintStyle: const TextStyle(color: Colors.black54),
                      errorText: _emptyEmail,
                    ),
                  ),
                ),
                const SizedBox(height: 12.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    boxShadow: [
                      BoxShadow(
                        color: themeColor.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 2,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: _obscureText,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(
                          color: themeColor,
                        ),
                      ),
                      hoverColor: themeColor.withOpacity(0.8),
                      hintText: 'Password',
                      labelText: 'Password',
                      hintStyle: const TextStyle(color: Colors.black54),
                      errorText: _emptyPassword,
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith(
                          (states) => themeColor.withOpacity(0.8),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password?'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}

class CirclesBackground extends StatelessWidget {

  CirclesBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: -120,
            right: 0,
            child: _getCircle(height: 200, width: 200, color: const Color.fromRGBO(186, 217, 254, 1)),
            ),
        Positioned(
            top: -80,
            right: -100,
            child:  _getCircle(height: 200, width: 200, color: colorScheme!.inversePrimary),
            ),
        Positioned(
            bottom: -120,
            left: 0,
            child: _getCircle(height: 200, width: 200, color: const Color.fromRGBO(186, 217, 254, 1)),
            ),
        Positioned(
            bottom: -80,
            left: -100,
            child:  _getCircle(height: 200, width: 200, color: colorScheme!.inversePrimary),
            ),

      ],
    );
  }
  _getCircle({required double height, required double width, Widget? widget, required Color color}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          shape: BoxShape.circle, color: color),
      child: widget,
    );
  }
}
