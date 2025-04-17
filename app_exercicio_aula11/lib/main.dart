import 'package:app_exercicio_aula11/screens/brasil.dart';
import 'package:app_exercicio_aula11/screens/italia.dart';
import 'package:app_exercicio_aula11/screens/japao.dart';
import 'package:app_exercicio_aula11/screens/us.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(NavBottom());
}

class NavBottom extends StatelessWidget {
  const NavBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // NavScreen é o widget do tipo Stateful que irá mudar a tela
      // conforme selecionamos
      home: NavScreen(),
    );
  }
}

class NavScreen extends StatefulWidget {
  const NavScreen({super.key});

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  // cria uma variavel que quando cada icone do Bottom
  // Navigator for selecionado irá mudar a tela
  int selectindex = 0;
  // constante que irá definir  as caracteristicas do texto do app
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  // Cria lista de Widgets (Telas ) que serão exibidos com base na seleçao
  // do BottomNavigationBar

  static const List<Widget> _widgetOptions = <Widget>[
    /*Text(
        'Index 0: Home',style: optionStyle,
      ),*/
    Brasil(),
    /*Text(
        'Index 1: School',style: optionStyle,
      ),*/
    Japao(),
    /*Text(
        'Index 2: Business',style: optionStyle,
      ),*/
    EstadosUnidos(),
    /*Text(
        'Index 3: Chatbot',style: optionStyle,
      ),*/
    Italia()
  ];

  // cria função que será responsável por alterar o index da seleção de tela
  void onItemTapped(int index) {
    setState(() {
      selectindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Países e suas comidas típicas",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
      ),
      body: Center(
        // _widgetOptions é a lista de de telas
        // selectedindex é o index selecionado da tela
        child: _widgetOptions.elementAt(selectindex),
      ),
      // Bottom navigator bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectindex,
        selectedItemColor: Colors.white,
        onTap: onItemTapped,
        backgroundColor: const Color.fromARGB(255, 20, 20, 20),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.south_america_outlined),
              label: 'Brasil',
              backgroundColor: const Color.fromARGB(255, 211, 247, 4)),
          BottomNavigationBarItem(
            icon: Icon(Icons.ramen_dining_outlined),
            label: 'Japão',
            backgroundColor: const Color.fromARGB(255, 255, 0, 0),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money_outlined),
            label: 'Estados Unidos',
            backgroundColor: const Color.fromARGB(255, 2, 1, 75),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_pizza_outlined),
            label: 'Itália',
            backgroundColor: const Color.fromARGB(255, 11, 87, 30),
          ),
        ],
      ),
    );
  }
}
