import 'package:flutter/material.dart';
import 'Recent.dart';

class Horizontal extends StatelessWidget {

  const Horizontal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      child: Column(
          children: [
            const Text(
                "Whatever",
                style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => null
              )
            )
          ],
        )
      );
  }
}