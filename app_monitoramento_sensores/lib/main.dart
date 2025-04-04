import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Dashboard(),
  ));
}

// Cria uma classe de tipo Stateless

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text(
          'Monitor de Sensores',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),

          // Cria botoes em Card
          _DashboardButton(
            icon: Icons.analytics_outlined,
            label: 'Monitoramento',
          ),

          SizedBox(
            height: 10,
          ),
          _DashboardButton(
            icon: Icons.settings_remote_outlined,
            label: 'Sistema de controle',
          ),

          SizedBox(
            height: 10,
          ),
          _DashboardButton(
            icon: Icons.smart_toy_outlined,
            label: 'Chatbot',
          ),
        ],
      ),
      // cria widget Botton Navigator
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.white,
        backgroundColor: Colors.green,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
        ],
      ),
    );
  }
}

// Cria uma classe chamada DashboardButton

class _DashboardButton extends StatelessWidget {
  // Criando atributos para a classe

  final IconData icon;
  final String label;

  // Criando construtor com passagem de parametros obrigatorios

  const _DashboardButton({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    //  novo widget que permite tocar na tela
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.brown,
                size: 40,
              ),
              SizedBox(
                width: 16,
              ),
              Text(
                label,
                style: TextStyle(fontSize: 18, color: Colors.green),
              )
            ],
          ),
        ),
      ),
    );
  }
}
