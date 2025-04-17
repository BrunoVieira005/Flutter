import 'package:flutter/material.dart';

class Brasil extends StatelessWidget {
  const Brasil({super.key});
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
            '🇧🇷',
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
      Center(
        child: Text(
          "Brasil - Feijoada",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
        ),
      ),
      Image.asset('images/feijoada.jpeg'),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Prato tradicional brasileiro, feito com feijão preto, carne de porco e acompanhamentos como arroz, farofa e laranja.',
            style: TextStyle(fontSize: 16),
          ))
    ]);
  }
}
