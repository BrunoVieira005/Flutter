import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});
    static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Column(
     mainAxisAlignment: MainAxisAlignment.center,
     children: [
      Center (
        child: Text(
          "Mobile 1", style: optionStyle,
        ),
      )
     ],
    );
  }
}