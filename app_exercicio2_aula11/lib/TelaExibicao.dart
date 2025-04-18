import 'package:flutter/material.dart';

class TelaExibicao extends StatelessWidget {
  final String nome;
  final int? idade;
  final String profissao;
  final String sexo;
  final String estadoCivil;

  const TelaExibicao({
    super.key,
    required this.nome,
    required this.idade,
    required this.profissao,
    required this.sexo,
    required this.estadoCivil,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informações do Usuário"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Nome: $nome", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Idade: $idade", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Profissão: $profissao", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Sexo: $sexo", style: TextStyle(fontSize: 18)),
            SizedBox(height: 8),
            Text("Estado Civil: $estadoCivil", style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
