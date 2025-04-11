import 'package:app_aula11/screens/tela1.dart';
import 'package:app_aula11/screens/tela2.dart';
import 'package:app_aula11/screens/tela3.dart';
import 'package:app_aula11/screens/tela4.dart';
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
    Home(),
    /*Text(
        'Index 1: School',style: optionStyle,
      ),*/
    CheckboxExample(),
    /*Text(
        'Index 2: Business',style: optionStyle,
      ),*/
    RadioButton(),
    /*Text(
        'Index 3: Chatbot',style: optionStyle,
      ),*/
    ChatScreen()
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
        title: Text("Aplicativo aula 11"),
        centerTitle: true,
        backgroundColor: Colors.teal,
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
        backgroundColor: Colors.red,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.red),
          BottomNavigationBarItem(
            icon: Icon(Icons.school_outlined),
            label: 'School',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_outlined),
            label: 'Business',
            backgroundColor: Colors.orange,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.smart_toy_rounded),
            label: 'Chatbot',
            backgroundColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}
