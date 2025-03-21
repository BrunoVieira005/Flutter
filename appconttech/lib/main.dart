import 'package:flutter/material.dart';

void main() {
  runApp(const ContTech());
}

class ContTech extends StatelessWidget {
  const ContTech({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("App aula 08 - ContTech"),
          ),
          // body corpo do Scaffold
          body: Home(),
        ));
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variavel Contador
  int contador = 0;
  String nome = "";
  // Cria função para incrementar
  _incrementar() {
    setState(() {
      contador++;
    });
  }

  // Cria função para resetar
  _resetar() {
    setState(() {
      contador = 0;
    });
  }

  _exibeNome() {
    setState(() {
      nome = "Bruno";
    });
  }

  _limparNome() {
    setState(() {
      nome = "";
    });

    @override
    Widget(BuildContext context) {
      return Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: Text(
                  "Contador: ${contador}",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 250,
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 200,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blueAccent,
                child: Text(
                  "${nome}",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // ElevatedButton(onPressed: _exibemsg, child: Text("Mensagem"),),
              IconButton(onPressed: _incrementar, icon: Icon(Icons.plus_one)),
              IconButton(onPressed: _resetar, icon: Icon(Icons.restart_alt)),
              IconButton(onPressed: _exibeNome, icon: Icon(Icons.show_chart)),
              IconButton(onPressed: _limparNome, icon: Icon(Icons.remove)),
            ],
          ),
        ],
      );
    }
  }
}
