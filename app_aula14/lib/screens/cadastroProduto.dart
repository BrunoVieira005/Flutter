import 'package:flutter/material.dart';
import 'prod_Screen.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CadastroProduto extends StatefulWidget {
  const CadastroProduto({super.key});

  @override
  State<CadastroProduto> createState() => _CadastroProdutoState();
}

class _CadastroProdutoState extends State<CadastroProduto> {
  // Criando variaveis para cadastro dos produtos
  TextEditingController nomeProd = TextEditingController();
  TextEditingController valorProd = TextEditingController();
  TextEditingController qtd = TextEditingController();

  // Função para cadastro do produto
  _cadastrarProduto() async {
    String url = "http://10.109.83.12:3000/produtos";
    // Estrutura da mensagem para cadastro dos produtos
    Map<String, dynamic> prod = {
      "id": nomeProd.text,
      "nome": nomeProd.text,
      "valorProd": valorProd.text,
      "qtd": qtd.text,
    };
    await http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(prod));
    nomeProd.text = "";
    valorProd.text = "";
    qtd.text = "";

    // Caixa de diálogo ao cadastrar um produto
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Text("Produto ${nomeProd.text} cadastrado com sucesso"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Fechar"))
            ],
          );
        });
  } // Função para deletar um produto

  _deletarProduto() {
    http.delete(
        Uri.parse("http://10.109.83.12:3000/produtos/${nomeProd.text}"));
    nomeProd.text = "";

    // Caixa de diálogo ao deletar um produto
    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Text("Produto ${nomeProd.text} deletado com sucesso"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Fechar"))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("App e-Commerce"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Digite o nome do produto"),
              controller: nomeProd,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Digite o valor do produto"),
              controller: valorProd,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)),
                  hintText: "Digite a quantidade do produto"),
              controller: qtd,
            ),
          ),
          ElevatedButton(
              onPressed: _cadastrarProduto, child: Text("Cadastrar produto")),
          ElevatedButton(
              onPressed: _deletarProduto, child: Text("Deletar produto")),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Produto_screen()));
            },
            child: Text("Produtos Screen"),
          )
        ],
      ),
    );
  }
}
