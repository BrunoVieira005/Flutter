import 'package:flutter/material.dart';

class Italia extends StatelessWidget {
  const Italia({super.key});
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
            '🇮🇹',
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
      Center(
        child: Text(
          "Itália - Pizzas",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
        ),
      ),
      Image.asset('images/pizza.jpg'),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Prato italiano famoso, com uma base de massa, molho de tomate, queijo e diversos ingredientes, como presunto, cogumelos e vegetais.',
            style: TextStyle(fontSize: 16),
          ))
    ]);
  }
}
