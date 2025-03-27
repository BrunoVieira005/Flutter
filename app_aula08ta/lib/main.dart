import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaPrincipal()));
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Aula 09 - Input Text"),
      ),
      body: CampoTexto(),
    );
  }
}

// Cria a classe CampoTexto do tipo Stateful

class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  // Armazena o que o usuário digitar no campo TextField
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();

  String _nome = "";
  int? _idade = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Cria o Widget TextField
        TextField(
          keyboardType: TextInputType.name,
          decoration: InputDecoration(labelText: "Digite seu nome"),
          controller: nome,
        ),

        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(hintText: "Digite sua idade"),
          controller: idade,
        ),

        ElevatedButton(
            onPressed: () {
              print("Texto digitado ${nome.text}");
              print("Texto digitado ${idade.text}");

              setState(() {
                _nome = nome.text;
                _idade = int.tryParse(idade.text);
              });
            },
            child: Text("Exibir")),
        Container(
            width: 200,
            height: 200,
            color: Colors.blue,
            child: Text(
              "${nome.text} - idade: ${idade.text}",
              style: TextStyle(fontSize: 20),
            ))
      ],
    );
  }
}
