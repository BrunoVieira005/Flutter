import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // biblioteca para decodificar o json

class CadastroUsuario extends StatefulWidget {
  const CadastroUsuario({super.key});

  @override
  State<CadastroUsuario> createState() => _CadastroUsuarioState();
}

class _CadastroUsuarioState extends State<CadastroUsuario> {
  // Criando variaveis para usuário e senha
  TextEditingController user_n = TextEditingController();
  TextEditingController senha_n = TextEditingController();

  // variavel para exibir a senha
  bool exibir = false;

  // Função para realizar o cadastro
  _cadastraUsuario() async {
    // URL com a api dos usuarios
    String url = "http://10.109.83.10:3000/usuarios";
    // Criando a variavel para armazenar a resposta da api
    http.Response resposta = await http.get(Uri.parse(url));

    // Cria dado para fazer o post cadastrando o usuario
    Map<String, dynamic> mensagem = {
      "id": user_n.text,
      "login": user_n.text,
      "senha": senha_n.text
    };

    // Criando a requisição POST para cadastrar o usuário
    http.post(Uri.parse(url),
        headers: <String, String>{
          'Content-type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(mensagem));
    print("Usuário cadastrado");
    user_n.text = "";
    senha_n.text = "";

    showDialog(
        context: context,
        builder: (BuildContext) {
          return AlertDialog(
            content: Text("Usuário cadastrado com sucesso"),
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
        title: Text("Cadastrar usuário"),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // Tipo do teclado
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          icon: Icon(
                            Icons.people_alt_outlined,
                            color: Colors.red,
                          ),
                          hintText: "Digite seu login"),
                      controller: user_n,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      // Tipo do teclado
                      keyboardType: TextInputType.name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8)),
                          icon: Icon(
                            Icons.key_off_outlined,
                            color: Colors.red,
                          ),
                          // Parâmetro para exibir ou ocultar a senha
                          suffixIcon: IconButton(
                              icon: Icon(exibir
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                              onPressed: () {
                                setState(() {
                                  exibir = !exibir;
                                });
                              }),
                          hintText: "Digite sua senha"),
                      obscureText: exibir,
                      obscuringCharacter: '*',
                      controller: senha_n,
                    ),
                  ),
                  ElevatedButton(
                      onPressed: _cadastraUsuario, child: Text("Cadastrar")),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
