// criando a segunda tela do aplicativo
import 'package:flutter/material.dart';

// Cria classe de sensores
class SensorData {
  final String title;
  final String value;
  final String status;
  final Color statusColor;
  final String imagePath;
// Cria o construtor
  SensorData(
      {required this.title,
      required this.value,
      required this.status,
      required this.statusColor,
      required this.imagePath});
}

// cria a classe da tela 2

class ColetaDadosScreen extends StatelessWidget {
  ColetaDadosScreen({super.key});

  // Cria lista com os sensores

  final List<SensorData> sensores = [
    // primeiro sensor
    SensorData(
        title: 'Umidade do solo',
        value: '80%',
        status: 'Bom',
        statusColor: Colors.blue,
        imagePath: 'images/1.png'),

    SensorData(
        title: 'Temperatura',
        value: '25 ºC',
        status: 'Bom',
        statusColor: Colors.blue,
        imagePath: 'images/2.png'),
    SensorData(
        title: 'Luminosidade',
        value: '80%',
        status: 'Bom',
        statusColor: Colors.blue,
        imagePath: 'images/3.png'),

    SensorData(
        title: 'Niveis de ph',
        value: '2',
        status: 'Ruim',
        statusColor: Colors.red,
        imagePath: 'images/4.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF5EE),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.brown,
          ),
        ),
        title: Text(
          'Monitoramento',
          style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      // Widget novo Listview.builder
      body: ListView.builder(
          // itemCount é para verificar o tamanho da lista dos elementos
          itemCount: sensores.length,
          // context esta relacionado a tela e o index a quantidade de elementos
          itemBuilder: (context, index) {
            final sensor = sensores[index];
            return SensorCard(sensor: sensor);
          }),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF40251C),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          currentIndex: 0,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: ''),
          ]),
    );
  }
}

// cria a classe sensor card

class SensorCard extends StatelessWidget {
  final SensorData sensor;
  SensorCard({super.key, required this.sensor});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            child: Image.asset(
              sensor.imagePath,
              height: 120,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  sensor.title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      sensor.value,
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        sensor.status,
                        style: TextStyle(
                            color: sensor.statusColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
