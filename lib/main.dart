import 'package:flutter/material.dart';
import 'dart:math' as math;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple custom widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class StartPage extends StatelessWidget {
  const StartPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const SimpleCustomWidget(name: "Card"),
    );
  }
}

class SimpleCustomWidget extends StatelessWidget {
  const SimpleCustomWidget({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(name),
          const StatefulCard(),
        ],
      ),
    );
  }
}

class StatefulCard extends StatefulWidget {
  const StatefulCard({super.key});

  @override
  State<StatefulWidget> createState() => _StatefulCardState();
}

class _StatefulCardState extends State<StatefulCard> {
  Color cardColor = Colors.white38;
  Color avatarColor = Colors.grey;

  void changeCardColor() {
    setState(() {
      cardColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
    });
  }

  void changeAvatarColor() {
    setState(() {
      avatarColor = Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
          .withOpacity(1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40.0),
      ),
      color: cardColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 120,
                    child: CircleAvatar(
                      backgroundColor: avatarColor,
                      radius: 115,
                      child: const Icon(Icons.person, size: 150),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(5),
                  child: Text(
                    "Title",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "Some really long description below the title, two lines at least",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                ButtonBar(
                  buttonPadding: const EdgeInsets.symmetric(horizontal: 30),
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: changeCardColor,
                      child: const Text("Left Button"),
                    ),
                    TextButton(
                      onPressed: changeAvatarColor,
                      child: const Text("Right Button"),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
