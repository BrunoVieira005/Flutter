import 'package:flutter/material.dart';
// importa a biblioteca http que permite utilizar os metodos http
import 'package:http/http.dart' as http;
import 'dart:convert'; // biblioteca que permite a conversao dos dados

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // cria a variavel para armazenar o cep digitado pelo usuario
  TextEditingController ncep = TextEditingController();
  String? logradouro;
  String? bairro;
  String? cidade;
  String? ddd;
  String? estado;

  // função que realiza a consulta do cep

  _consultaCep() async {
    // Cria variável com a URL para consultar o CEP
    String url = "https://viacep.com.br/ws/13060354/json/";
    String url2 = "https://cep.awesomeapi.com.br/${ncep.text}";

    // Cria variável do método HTTP Response
    http.Response response; // Variável que irá armazenar a resposta da API
    response = await http.get(Uri.parse(url2));

    // Realizando o parse da resposta da API
    Map<String, dynamic> dados =
        json.decode(response.body); // Informação codificada

    setState(() {
      logradouro = dados["address"];
      bairro = dados["district"];
      cidade = dados["city"];
      ddd = dados["ddd"];
      estado = dados["state"];
    });

    print("Codigo de status da API ${response.statusCode.toString()}");
    print("Resposta da API");
    print("${response.body}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Aula 13 - Consulta CEP"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Digite o CEP"),
            controller: ncep,
          ),
          SizedBox(
            child: 
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ElevatedButton(
                onPressed: _consultaCep, child: Text("Consultar")),
            ),
            width: double.infinity,
          ),
          Text(
            "Endereço:",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "Logradouro: ${logradouro} ",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "Bairro: ${bairro} ",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "Cidade ${cidade} - ${estado} ",
            style: TextStyle(fontSize: 18),
          ),
          Text(
            "DDD: ${ddd}",
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }
}
