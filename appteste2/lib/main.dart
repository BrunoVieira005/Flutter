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
          title: Text("App aula 08 - Multi child layout"),
        ),
        // body corpo do Scaffold
        body: Column(
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
                    "Stack",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 350,
              child: Expanded(
                  child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Usuario 1"),
                    subtitle: Text("Descrição do usuario 1"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Usuario 2"),
                    subtitle: Text("Descrição do usuario 2"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_add_alt_1_sharp),
                    title: Text("Usuario 3"),
                    subtitle: Text("Descrição do usuario 3"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Usuario 4"),
                    subtitle: Text("Descrição do usuario 4"),
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text("Usuario 5"),
                    subtitle: Text("Descrição do usuario 5"),
                  ),
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
