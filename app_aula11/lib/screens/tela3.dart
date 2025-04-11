import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  // Cria uma variável chamada selectoption
  int? selectOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RadioListTile<int>(
            title: Text('Opção 1'),
            value: 1,
            groupValue: selectOption,
            onChanged: (value) {
              setState(() {
                selectOption = value;
              });
            }),
        RadioListTile(
            title: Text("Opção 2"),
            value: 2,
            groupValue: selectOption,
            onChanged: (value) {
              setState(() {
                selectOption = value;
              });
            }),
        RadioListTile(
            title: Text("Opção 3"),
            value: 3,
            groupValue: selectOption,
            onChanged: (value) {
              setState(() {
                selectOption = value;
              });
            }),
        Text("RadioButton opção - $selectOption",
            style: TextStyle(fontSize: 18))
      ],
    );
  }
}
