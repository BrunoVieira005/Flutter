import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Telaacionamento extends StatefulWidget {
  const Telaacionamento({super.key});

  @override
  State<Telaacionamento> createState() => _TelaacionamentoState();
}

class _TelaacionamentoState extends State<Telaacionamento> {
  final bool status = false;
  Color status_cor = Colors.red;
  int? temperatura;
  int? umidade;
  int? bomba;
  int? sensorUmidSolo;
  int? pH;

  Future<void> _leitura() async {
    final response = await http.get(Uri.parse('http://10.109.83.12/dados'));
    print(response.body);
    final dados = json.decode(response.body);
    setState(() {
      temperatura = (dados["temperatura"]);
      umidade = (dados["umidade"]);
      sensorUmidSolo = (dados["sensor_umidsolo"]);
      pH = (dados["pH"]);
      bomba = dados["bomba"];
      print(temperatura);
      print(umidade);
      print(sensorUmidSolo);
      print(pH);
      print(bomba);
    });
  }

  Future<void> _ligarBomba() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.109.83.12/bomba'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'estado': 1}),
      );

      if (response.statusCode == 200) {
        setState(() {
          status_cor = Colors.green;
        });
        print("Bomba ligada com sucesso!");
      } else {
        print("Erro ao ligar a bomba: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro na requisição: $e");
    }
  }

  Future<void> _desligarBomba() async {
    try {
      final response = await http.post(
        Uri.parse('http://10.109.83.12/bomba'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'estado': 0}),
      );

      if (response.statusCode == 200) {
        setState(() {
          status_cor = Colors.red;
        });
        print("Bomba desligada com sucesso!");
      } else {
        print("Erro ao ligar a bomba: ${response.statusCode}");
      }
    } catch (e) {
      print("Erro na requisição: $e");
    }
  }

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
            'Acionamento',
            style: TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        // Widget novo Listview.builder
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 200,
                  height: 200,
                  color: status_cor,
                  child: Text(
                    "Bomba de irrigação",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white),
                  onPressed: _ligarBomba,
                  child: Text('Ligar bomba'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white),
                  onPressed: _desligarBomba,
                  child: Text('Desligar bomba'),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      foregroundColor: Colors.white),
                  onPressed: _leitura,
                  child: Text('Leitura'),
                ),
              ),
            ],
          ),
        ));
  }
}
