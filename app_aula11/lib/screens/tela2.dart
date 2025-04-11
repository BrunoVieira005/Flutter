import 'package:flutter/material.dart';

class CheckboxExample extends StatefulWidget {
  const CheckboxExample({super.key});

  @override
  State<CheckboxExample> createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool ischeck = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Checkbox 1"),
            // Cria o widget Checkbox
            Checkbox(
                value: ischeck,
                onChanged: (bool? value) {
                  setState(() {
                    ischeck = value!;
                  });
                }),
            Text("Status do checkbox - $ischeck"),
          ],
        ),
      ),
    );
  }
}
