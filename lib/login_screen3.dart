import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:login_screens/util/util.dart';
import 'buttons/gradient_button.dart';
import 'main.dart';

class LoginScreen3 extends StatefulWidget {
  const LoginScreen3({super.key});

  @override
  LoginStateScreen3 createState() => LoginStateScreen3();
}

class LoginStateScreen3 extends State<LoginScreen3> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscureText = true;
  String? _emptyEmail;
  String? _emptyPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: <Widget>[
          FadeInDown(
              duration: const Duration(milliseconds: 1300),
              child: Container(
                height: 370,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                        bottomRight: Radius.circular(100)),
                    gradient: LinearGradient(colors: [
                      themeColor.withOpacity(0.8),
                      themeColor.withOpacity(0.6),
                    ])),
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        height: 240,
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: getTitleFormated(
                            title: 'APP',
                            subtitle: 'Name',
                            colorText: Colors.white,
                            biggest: true,
                          ),
                        )),
                    Positioned(
                      child: Container(
                        margin: const EdgeInsets.only(top: 180),
                        child: const Center(
                          child: Text(
                            'Welcome',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )),
          FadeInUp(
              duration: const Duration(milliseconds: 1300),
              child: Padding(
                padding:
                    const EdgeInsets.only(left: 40.0, right: 40.0, top: 40),
                child: Column(
                  children: <Widget>[
                    _getShadowWidget(TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Email',
                        labelText: 'Email',
                        hintStyle: const TextStyle(color: Colors.black45),
                        errorText: _emptyEmail,
                      ),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    _getShadowWidget(TextFormField(
                        controller: _passwordController,
                        obscureText: _obscureText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          labelText: 'Password',
                          hintStyle: const TextStyle(color: Colors.black54),
                          errorText: _emptyPassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscureText
                                  ? Icons.lock_outline
                                  : Icons.lock_open_outlined,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                          ),
                        ))),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              themeColor.withOpacity(0.6),
                              themeColor.withOpacity(0.4),
                            ]),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                  color: themeColor.withOpacity(0.2),
                                  blurRadius: 1.0,
                                  offset: const Offset(0, 1))
                            ]),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 5, top: 3),
                            child: GradientButton(
                                width: double.infinity,
                                height: 50,
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  themeColor.withOpacity(0.4),
                                  themeColor.withOpacity(0.2),
                                ]),
                                onPressed: () async {},
                                child: const Text('Login',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))))),
                    const SizedBox(
                      height: 70,
                    ),
                    TextButton(
                        onPressed: () => {},
                        child: Text(
                          'Forgot password?',
                          style: TextStyle(color: themeColor.withOpacity(0.9)),
                        )),
                  ],
                ),
              ))
        ],
      ),
    ));
  }

  _getShadowWidget(Widget widget) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              themeColor.withOpacity(0.6),
              themeColor.withOpacity(0.4),
            ]),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: themeColor.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: const Offset(0, 1))
            ]),
        child: Padding(
            padding: const EdgeInsets.only(left: 5, top: 3),
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                    padding: const EdgeInsets.only(left: 5), child: widget))));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
