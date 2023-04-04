import 'package:Cassette/components/Vertical.dart';
import 'package:flutter/material.dart';
import '../components/Horizontal.dart';
import '../logic/loadsongs.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Utilities().main();
    return const Vertical();
  }
}