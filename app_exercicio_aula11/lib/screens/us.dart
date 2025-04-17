import 'package:flutter/material.dart';

class EstadosUnidos extends StatelessWidget {
  const EstadosUnidos({super.key});
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '🇺🇸',
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
      Center(
        child: Text(
          "Estados Unidos - Panquecas",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
        ),
      ),
      Image.asset('images/panqueca.jpg'),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Massa fina e macia, geralmente servida no café da manhã, com opções de recheios doces, como frutas e mel, ou salgados, como carne e queijo.',
            style: TextStyle(fontSize: 16),
          ))
    ]);
  }
}
