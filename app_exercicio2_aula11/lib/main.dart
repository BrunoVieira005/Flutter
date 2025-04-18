import 'package:app_exercicio2_aula11/TelaExibicao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: TelaPrincipal()));
}

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Cadastro"),
      ),
      body: CampoTexto(),
    );
  }
}

// Cria a classe CampoTexto do tipo Stateful
class CampoTexto extends StatefulWidget {
  const CampoTexto({super.key});

  @override
  State<CampoTexto> createState() => _CampoTextoState();
}

class _CampoTextoState extends State<CampoTexto> {
  TextEditingController nome = TextEditingController();
  TextEditingController idade = TextEditingController();
  TextEditingController profissao = TextEditingController();

  String _nome = "";
  int? _idade = 0;
  String _profissao = "";
  int? selectOption;
  int? selectState;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16), // Padding para a tela inteira
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Organiza os campos alinhados à esquerda
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0), // Padding inferior
            child: TextField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(hintText: "Digite seu nome: "),
              controller: nome,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0), // Padding inferior
            child: TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "Digite sua idade: "),
              controller: idade,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(bottom: 16.0), // Padding inferior maior
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "Digite sua profissão: "),
              controller: profissao,
            ),
          ),
          Text(
            'Sexo: ',
            style: TextStyle(fontSize: 18),
          ),
          Column(
            children: [
              RadioListTile<int>(
                title: Text('Masculino'),
                value: 1,
                groupValue: selectOption,
                onChanged: (value) {
                  setState(() {
                    selectOption = value;
                  });
                },
              ),
              RadioListTile(
                title: Text("Feminino"),
                value: 2,
                groupValue: selectOption,
                onChanged: (value) {
                  setState(() {
                    selectOption = value;
                  });
                },
              ),
            ],
          ),
          Text(
            'Estado Civil: ',
            style: TextStyle(fontSize: 18),
          ),
          Column(
            children: [
              RadioListTile<int>(
                title: Text('Casado'),
                value: 1,
                groupValue: selectState,
                onChanged: (value) {
                  setState(() {
                    selectState = value;
                  });
                },
              ),
              RadioListTile(
                title: Text("Solteiro"),
                value: 2,
                groupValue: selectState,
                onChanged: (value) {
                  setState(() {
                    selectState = value;
                  });
                },
              ),
              RadioListTile(
                title: Text("Divorciado"),
                value: 3,
                groupValue: selectState,
                onChanged: (value) {
                  setState(() {
                    selectState = value;
                  });
                },
              ),
              RadioListTile(
                title: Text("Viúvo"),
                value: 4,
                groupValue: selectState,
                onChanged: (value) {
                  setState(() {
                    selectState = value;
                  });
                },
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _nome = nome.text;
                _idade = int.tryParse(idade.text);
                _profissao = profissao.text;
              });

              // Navega para a tela de exibição
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaExibicao(
                    nome: _nome,
                    idade: _idade,
                    profissao: _profissao,
                    sexo: selectOption == 1
                        ? 'Masculino'
                        : selectOption == 2
                            ? 'Feminino'
                            : 'Não especificado',
                    estadoCivil: selectState == 1
                        ? 'Casado'
                        : selectState == 2
                            ? 'Solteiro'
                            : selectState == 3
                                ? 'Divorciado'
                                : selectState == 4
                                    ? 'Viúvo'
                                    : 'Não especificado',
                  ),
                ),
              );
            },
            child: Text("Exibir"),
          ),
        ],
      ),
    );
  }
}
