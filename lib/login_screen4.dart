import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_screens/util/util.dart';
import 'buttons/gradient_button.dart';
import 'main.dart';

class LoginScreen4 extends StatefulWidget {
  const LoginScreen4({super.key});

  @override
  LoginStateScreen4 createState() => LoginStateScreen4();
}

class LoginStateScreen4 extends State<LoginScreen4> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String? _emptyEmail;
  String? _emptyPassword;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            CirclesBackground(
              widget: Center(
                child: getTitleFormated(
                  title: 'APP',
                  subtitle: 'Name',
                  colorText: Colors.white,
                  biggest: true,
                ),
              ),
            ),
            Center(
              child: FadeIn(
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(left: 30, right: 30),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: colorScheme!.inversePrimary.withOpacity(0.8)),
                    boxShadow: [
                      BoxShadow(
                        color: themeColor.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                            hintStyle: const TextStyle(color: Colors.black54),
                            errorText: _emptyEmail,
                          ),
                      ),
                      TextFormField(
                          controller: _passwordController,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              hintText: 'Password',
                              labelText: 'Password',
                              hintStyle: const TextStyle(color: Colors.black54),
                              errorText: _emptyPassword,
                              suffixIcon: IconButton(
                                icon: Icon(_obscureText
                                    ? Icons.lock_outline
                                    : Icons.lock_open_outlined),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              )),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      GradientButton(
                              width: double.infinity,
                              height: 50,
                              borderRadius: BorderRadius.circular(10),
                              gradient: LinearGradient(colors: [
                                colorScheme!.inversePrimary.withOpacity(1),
                                colorScheme!.inversePrimary.withOpacity(0.8),
                              ]),
                              onPressed: () async {},
                              child: const Text('Login',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold))),
                      SizedBox(height: 10),

                      TextButton(
                          onPressed: () => {},
                          child: Text(
                            'Forgot password?',
                            style:
                            TextStyle(color: themeColor.withOpacity(0.8)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 30,
              child: Center(
                child: FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Text.rich(
                    TextSpan(
                      text: 'Don\'t have an account yet? ',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: themeColor.withOpacity(0.8),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CirclesBackground extends StatelessWidget {
  Widget? widget;

  CirclesBackground({super.key, this.widget});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: -70,
            left: -50,
            child: FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: _getCircle(height: 400, width: 400, widget: widget, color: const Color.fromRGBO(186, 217, 254, 1)),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 4 +10,
            right: -220,
            child: FadeInRight(
              duration: const Duration(milliseconds: 1200),
              child: _getCircle(height: 400, width: 400, color: const Color.fromRGBO(186, 217, 254, 1)),
            )),
        Positioned(
            bottom: -90,
            left: -50,
            child: FadeInUp(
                duration: const Duration(milliseconds: 1200),
                child: _getCircle(height: 400, width: 400, color: const Color.fromRGBO(186, 217, 254, 1)),
            )),
        Positioned(
            top: -80,
            left: -50,
            child: FadeInDown(
              duration: const Duration(milliseconds: 1200),
              child: _getCircle(height: 400, width: 400, widget: widget, color: colorScheme!.inversePrimary),
            )),
        Positioned(
            top: MediaQuery.of(context).size.height / 4,
            right: -220,
            child: FadeInRight(
              duration: const Duration(milliseconds: 1200),
              child: _getCircle(height: 400, width: 400, color: colorScheme!.inversePrimary),
            )),
        Positioned(
            bottom: -80,
            left: -50,
            child: FadeInUp(
              duration: const Duration(milliseconds: 1200),
              child: _getCircle(height: 400, width: 400, color: colorScheme!.inversePrimary),
            )),
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
