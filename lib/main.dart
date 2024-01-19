import 'package:flutter/material.dart';
import 'login_screen5.dart';
import 'login_screen3.dart';
import 'login_screen1.dart';
import 'login_screen4.dart';
import 'login_screen2.dart';

void main() {
  runApp(const MyApp());
}

const Color themeColor = Colors.blue;
ColorScheme? colorScheme;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    colorScheme = ColorScheme.fromSeed(seedColor: themeColor);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      showSemanticsDebugger: false,
      title: 'Login Demo',
      theme: ThemeData(
        colorScheme: colorScheme,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            backgroundColor: colorScheme!.inversePrimary,
            titleTextStyle: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 22)),
      ),
      home: const MyHomePage(title: 'Login Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Map<String, Widget> listLoginScreen = {
    'Login Screen Simple Example 1': const LoginScreen1(),
    'Login Screen Simple Example 2': const LoginScreen2(),
    'Login Screen Animated Example 3': const LoginScreen3(),
    'Login Screen Animated Example 4': const LoginScreen4(),
    'Login Screen Carousel Example 5': const LoginScreen5(),
  };

  void _navigateTo(Widget screen) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: listLoginScreen.length,
        itemBuilder: (BuildContext context, int index) {
          final key = listLoginScreen.keys.elementAt(index);
          final value = listLoginScreen[key];
          return Card(
              child: ListTile(
            title: Text(
              key,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: Colors.black54),
            ),
            onTap: () {
              _navigateTo(value!);
            },
          ));
        },
      ),
    );
  }
}
