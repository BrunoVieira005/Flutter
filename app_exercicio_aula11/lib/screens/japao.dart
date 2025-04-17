import 'package:flutter/material.dart';

class Japao extends StatelessWidget {
  const Japao({super.key});
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
            '🇯🇵',
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
      Center(
        child: Text(
          "Japão - Ramen",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
        ),
      ),
      Image.asset('images/ramen.jpg'),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            'Sopa de macarrão japonesa, servida com caldo saboroso, geralmente à base de frango, porco ou peixe, e acompanhada de ovo, vegetais e carne.',
            style: TextStyle(fontSize: 16),
          ))
    ]);
  }
}
