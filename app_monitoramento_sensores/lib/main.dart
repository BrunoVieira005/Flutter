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
      backgroundColor: const Color.fromARGB(255, 225, 225, 225),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Monitor de Sensores',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),

            // Cria botoes em Card
            _DashboardButton(
                icon: Icons.device_thermostat,
                label: 'Temperatura do Ar',
                percentage: '0,0 ºC'),

            SizedBox(
              height: 20,
            ),
            _DashboardButton(
              icon: Icons.device_thermostat,
              label: 'Umidade do Ar',
              percentage: '0,0 %',
            ),

            SizedBox(
              height: 20,
            ),
            _DashboardButton(
              icon: Icons.device_thermostat,
              label: 'Temperatura do Solo',
              percentage: '0,0 ºC',
            ),

            SizedBox(
              height: 20,
            ),
            _DashboardButton(
              icon: Icons.device_thermostat,
              label: 'Umidade do Solo',
              percentage: '0,0 %',
            ),

            SizedBox(
              height: 20,
            ),

            ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: Text(
                  'Atualizar Dados',
                  style: TextStyle(color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}

// Cria uma classe chamada DashboardButton

class _DashboardButton extends StatelessWidget {
  // Criando atributos para a classe

  final IconData icon;
  final String label;
  final String percentage;

  // Criando construtor com passagem de parametros obrigatorios

  const _DashboardButton({
    required this.icon,
    required this.label,
    required this.percentage,
  });

  @override
  Widget build(BuildContext context) {
    //  novo widget que permite tocar na tela
    return InkWell(
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(05)),
        elevation: 3,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Row(
            children: [
              Icon(
                icon,
                color: Colors.green,
                size: 25,
              ),
              SizedBox(
                width: 13,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w500)),
                  Text(
                    percentage,
                    style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
