import 'package:app_aula14/screens/cadastroProduto.dart';
import 'package:app_aula14/screens/cadastroUsuario.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // biblioteca para decodificar o json

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Criando variáveis para Usuário e Senha
  TextEditingController user = TextEditingController();
  TextEditingController senha = TextEditingController();

  // Variável para exibir a senha
  bool exibir = false;

  // Função para realizar o login
  _verificaLogin() async {
    // Flag para quando encontrar o login
    bool encuser = false;

    // URL com a API dos usuários
    String url = "http://10.109.83.12:3000/usuarios";

    // Variável para armazenar a resposta da API
    http.Response resposta = await http.get(Uri.parse(url));
    List clientes =
        <Users>[]; // Cria uma lista para armazenar os usuários cadastrados
    print(resposta.statusCode);

    // Variável para armazenar os dados
    var dados = json.decode(resposta.body) as List;
    print("${dados[0]["login"]} ${dados[0]["senha"]}");

    // Laço de repetição para exibir mais de um usuário cadastrado na API
    for (int i = 0; i < dados.length; i++) {
      print("${dados[i]["login"]} ${dados[i]["senha"]}");
      if (user.text == dados[i]["login"] && senha.text == dados[i]["senha"]) {
        encuser = true;
      }
    }
    if (encuser == true) {
      print("Usuário ${user.text} encontrado");
      encuser = false;

      // Redioreciona para outra tela
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => CadastroProduto()));

      user.text = "";
      senha.text = "";
    } else {
      print("Usuário não encontrado!");

      //1ª forma de mostrar Pop-up de usuário não encontrado
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Usuário não encontrado"),
        duration: Duration(seconds: 2),
      ));

      // 2ª forma de mostrar Pop-up de usuário não encontrado
      showDialog(
          context: context,
          builder: (BuildContext) {
            return AlertDialog(
              content: Text("Usuário não encontrado"),
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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App Aula 14 - Login e Cadastro",
          style: TextStyle(fontWeight: FontWeight.w400, color: Colors.white),
        ),
        backgroundColor: Colors.red,
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
                        controller: user,
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
                            // parametro para exibir ou ocultar a senha
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
                        controller: senha,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: _verificaLogin, child: Text("Entrar")),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CadastroUsuario()));
                      },
                      child: Text("Cadastrar"),
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

// Cria classe Usuarios

class Users {
  String id;
  String login;
  String senha;
  // Construtor
  Users(this.id, this.login, this.senha);
  // Método para acessar os usuários
  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(json["id"], json["nome"], json["senha"]);
  }
}
