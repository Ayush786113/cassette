import 'package:Cassette/components/Horizontal.dart';
import 'package:Cassette/components/Vertical.dart';
import 'package:flutter/material.dart';
import './sections/Body.dart';

void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cassette',
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "Cassette"
          ),
        ),
        body: const Body(),
      ),
    );
  }
}