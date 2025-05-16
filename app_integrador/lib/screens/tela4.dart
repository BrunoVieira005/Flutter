import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  // cria lista com mensagens
  final List<Map<String, dynamic>> _messages = [
    /*{
      'text': "Tipos de solos agricola",
      'isMe': true,
      'time': "5:20 PM",
    },
    {'text': 'Calcario, Argiloso', 'isMe': true, 'time': '5:18 PM'},
    {
      'text': 'Qual a melhor semente para plantar em maio',
      'isMe': false,
      'time': '5:20'
    },
    {'text': 'Agro IoT', 'isMe': false, 'time': '5:22 PM'},
    {'text': 'Chatbot', 'isMe': false, 'time': '5:22 PM'},
    {'text': 'ChatBot', 'isMe': false, 'time': '5:30 PM'}
    */
  ];

  void _sendMessage() async {
    final userMessage = _controller.text.trim();
    String url =
        "https://bruno-vieira-api-agro-langflow-mb-ads-v.hf.space/api/v1/run/55dee866-b776-4833-a45d-29394a893f5e";
    if (_controller.text.trim().isEmpty) return;
    setState(() {
      _messages.add({
        'text': userMessage,
        'isMe': true,
        // pega a data e hora da mensagem digitada
        'time': TimeOfDay.now().format(context),
      });
      _controller.clear();
    });
    try {
      final response = await http.post(Uri.parse(url),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            "input_value": userMessage,
            "output_type": "chat",
            "input_type": "chat"
          }));

      if (response.statusCode == 200) {
        final decoded = jsonDecode(utf8.decode(response.bodyBytes));
        print("Resposta a API: $decoded");
        final botReply = decoded["outputs"]?[0]?["outputs"]?[0]?["results"]
                ?["message"]?["text"] ??
            "Não consegui entender";
        setState(() {
          _messages.add({
            'text': botReply,
            'isMe': false,
            'time': TimeOfDay.now().format(context),
          });
        });
      } else {
        setState(() {
          _messages.add({
            'text': 'Erro ao obter resposta do assistente',
            'isMe': false,
            'time': TimeOfDay.now().format(context)
          });
        });
      }
    } catch (e) {
      setState(() {
        _messages.add({
          'text': 'Erro de conexão $e',
          'isMe': false,
          'time': TimeOfDay.now().format(context)
        });
      });
    }
  }

  // função para limpar as mensagens
  void _limparMessages() {
    setState(() {
      _messages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.person),
          ),
          title: Text(
            'Senai',
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.brown,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    final msg = _messages[index];
                    return MessageBubble(
                        text: msg['text'],
                        isMe: msg['isMe'],
                        time: msg['time']);
                  })),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                        hintText: 'Digite sua mensagem',
                        border: InputBorder.none),
                  ),
                ),
                IconButton(
                    onPressed: _sendMessage,
                    icon: Icon(
                      Icons.send,
                      color: Colors.teal,
                    )),
                IconButton(
                    onPressed: _limparMessages,
                    icon: Icon(
                      Icons.clear,
                      color: Colors.teal,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  // cria variaveis e construtor
  final String text;
  final bool isMe;
  final String time;
  const MessageBubble(
      {super.key, required this.text, required this.isMe, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 5),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
                color: isMe ? Colors.green[100] : Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
            child: Text(text),
          ),
          Text(
            time,
            style: TextStyle(fontSize: 10, color: Colors.grey),
          )
        ],
      ),
    );
  }
}
