// criando a segunda tela do aplicativo
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://10.109.83.12:8000';

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

class ColetaDadosScreen extends StatefulWidget {
  ColetaDadosScreen({super.key});

  @override
  State<ColetaDadosScreen> createState() => _ColetaDadosScreenState();
}

class _ColetaDadosScreenState extends State<ColetaDadosScreen> {
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
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            DetalheSensorScreen(sensor: sensor)));
              },
              child: SensorCard(sensor: sensor),
            );
          }),
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
              height: 240,
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

// Tela de Detalhes do Sensor
class DetalheSensorScreen extends StatefulWidget {
  final SensorData sensor;

  const DetalheSensorScreen({super.key, required this.sensor});

  @override
  State<DetalheSensorScreen> createState() => _DetalheSensorScreenState();
}

class _DetalheSensorScreenState extends State<DetalheSensorScreen> {
  Future<void> _leitura() async {
    final response = await http.get(Uri.parse('http://10.109.83.12/dados'));
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEAF5EE),
      appBar: AppBar(
        title: Text(widget.sensor.title),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                widget.sensor.imagePath,
                height: 240,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              "Valor: ${widget.sensor.value}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Status: ${widget.sensor.status}",
              style: TextStyle(
                fontSize: 16,
                color: widget.sensor.statusColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
