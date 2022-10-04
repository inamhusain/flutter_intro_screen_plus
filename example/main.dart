import 'package:flutter/material.dart';
import 'package:flutter_intro_screen_plus/flutter_intro_screen_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ExampleIntroScreen(),
      ),
    );
  }
}

class ExampleIntroScreen extends StatelessWidget {
  final List<IntroCardWidget> list = [
    const IntroCardWidget(
      title: "Title 1",
      content: "Content 1",
      imageIcon: Icons.restaurant_menu,
    ),
    const IntroCardWidget(
      title: "Title 2",
      content: "Content 2",
      imageIcon: Icons.search,
    ),
    const IntroCardWidget(
      title: "Title 3",
      content: "Content 3",
      imageIcon: Icons.shopping_cart,
    ),
    const IntroCardWidget(
      title: "Title 4",
      content: "Content 4",
      imageIcon: Icons.verified_user,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroScreen(
        walkthroughList: list,
        pageRoute:
            MaterialPageRoute(builder: (context) => ExampleIntroScreen()),
      ),
    );
  }
}
