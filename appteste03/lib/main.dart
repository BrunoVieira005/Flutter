import 'package:flutter/material.dart';

void main() {
  runApp(TelaApp());
}

class TelaApp extends StatelessWidget {
  const TelaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text("App Aula 08 - Multi Child Layout e Interatividade"),
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
  // Variavel mensagem
  String msg = "Mobile";
  //cria função para exibir mensagem no app
  _exibemsg() {
    setState(() {
      msg = "Mobile 1";
    });
  }

  _limpar() {
    setState(() {
      msg = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // Children estabelece a relação de filho  entre a coluna e os outros elementos
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.star,
              color: Colors.yellow,
              size: 50,
            ),
            Icon(Icons.favorite, color: Colors.red, size: 50),
            Icon(
              Icons.thumb_up,
              color: Colors.blue,
              size: 50,
            ),
          ],
        ),
        // Sizebox - widget que define o espaço do widget do app
        SizedBox(
          height: 20,
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              color: Colors.blueAccent,
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.black,
              child: Text(
                "${msg}",
                style: TextStyle(fontSize: 20, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        SizedBox(
            height: 250,
            child: ListView(
              children: [
                ListTile(
                  leading: Icon(Icons.person_2_rounded),
                  title: Text("Usuario 1"),
                  subtitle: Text("Descriçao do usuario 1"),
                ),
                ListTile(
                  leading: Icon(Icons.person_add_alt_1_sharp),
                  title: Text("Usuario 2"),
                  subtitle: Text("Descriçao do usuario 2"),
                ),
              ],
            )),
        Row(
          children: [
            ElevatedButton(
              onPressed: _exibemsg,
              child: Text("Mensagem"),
            ),
            ElevatedButton(onPressed: _limpar, child: Text("Limpar")),
            TextButton(onPressed: _limpar, child: Text("Limpar")),
            FloatingActionButton(
              onPressed: _exibemsg,
              child: Icon(Icons.access_alarm),
            ),
          ],
        ),
      ],
    );
  }
}
