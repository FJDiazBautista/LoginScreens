import 'package:flutter/material.dart';
import 'package:login_screens/main.dart';
import 'package:login_screens/util/util.dart';
import 'buttons/gradient_button.dart';

class LoginScreen5 extends StatefulWidget {
  const LoginScreen5({super.key});

  @override
  LoginStateScreen5 createState() => LoginStateScreen5();
}

class LoginStateScreen5 extends State<LoginScreen5> {
  late PageController _pageController;
  late PageView _pageView;
  int _index = 0;
  int animationDuration = 300;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageView = PageView(
      controller: _pageController,
      children: <Widget>[
        SignInScreen(),
        SignUpScreen(),
      ],
      onPageChanged: (index) {
        setState(() => _index = index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
        height: MediaQuery.of(context).size.height - 70,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color.fromRGBO(233, 239, 247, 1).withOpacity(0),
            const Color.fromRGBO(233, 239, 247, 1)
          ],
        )),
        child: Padding(
          padding: const EdgeInsets.only(top: 55.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                  height: 150,
                  child: Center(
                      child: getTitleFormated(
                          title: 'APP',
                          subtitle: 'name',
                          colorText: themeColor.withOpacity(0.8),
                          biggest: true))),
              Expanded(child: _pageView),
            ],
          ),
        ),
      )),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _index = index;
            _pageController.animateToPage(index,
                duration: Duration(milliseconds: animationDuration),
                curve: Curves.easeInOut);
          });
        },
        height: 70,
        indicatorColor: themeColor,
        selectedIndex: _index,
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.waving_hand),
            icon: Icon(Icons.waving_hand_outlined),
            label: 'Hi again!',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.supervised_user_circle_rounded),
            icon: Icon(Icons.supervised_user_circle_outlined),
            label: 'New user',
          ),
        ],
      ),
    );
  }
}

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, bottom: 30.0, top: 20),
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: themeColor.withOpacity(0.8)),
                boxShadow: [
                  BoxShadow(
                      color: themeColor.withOpacity(0.2),
                      blurRadius: 20.0,
                      offset: const Offset(0, 10))
                ]),
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      labelText: 'Email',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Divider(
                    color: themeColor.withOpacity(0.8),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      labelText: 'Password',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ])),
          ),
          const SizedBox(
            height: 30,
          ),
          GradientButton(
              width: double.infinity,
              height: 50,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                themeColor.withOpacity(0.8),
                themeColor.withOpacity(0.6),
              ]),
              onPressed: () async {},
              child: const Text('Login',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold))),
          const SizedBox(
            height: 70,
          ),
          TextButton(
              onPressed: () => {},
              child: Text(
                'Forgot password?',
                style: TextStyle(color: themeColor.withOpacity(0.9)),
              )),
        ]));
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            left: 30.0, right: 30.0, bottom: 30.0, top: 20),
        child: Column(children: <Widget>[
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: themeColor.withOpacity(0.8)),
                boxShadow: [
                  BoxShadow(
                      color: themeColor.withOpacity(0.2),
                      blurRadius: 20.0,
                      offset: const Offset(0, 10))
                ]),
            child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Name',
                      labelText: 'Name',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Divider(
                    color: themeColor.withOpacity(0.8),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Email',
                      labelText: 'Email',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Divider(
                    color: themeColor.withOpacity(0.8),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Password',
                      labelText: 'Password',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                  Divider(
                    color: themeColor.withOpacity(0.8),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Confirm password',
                      labelText: 'Confirm password',
                      hintStyle: TextStyle(color: Colors.black54),
                    ),
                  ),
                ])),
          ),
          const SizedBox(
            height: 30,
          ),
          GradientButton(
              width: double.infinity,
              height: 50,
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(colors: [
                themeColor.withOpacity(0.8),
                themeColor.withOpacity(0.6),
              ]),
              onPressed: () async {},
              child: const Text('New user',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)))
        ]));
  }
}
