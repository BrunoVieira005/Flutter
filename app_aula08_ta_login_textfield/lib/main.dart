import 'package:app_aula08_ta_login_textfield/Screen02.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Login(),
    debugShowCheckedModeBanner: false,
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController password = TextEditingController();
  _checkLogin() {
    if (user.text == "Senai" && password.text == "2025") {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Screen02()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Either username or password were wrong."),
        duration: Duration(seconds: 5),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            color: Colors.grey,
            child: Image.asset(
              'assets/images/senai.png',
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 250,
            height: 250,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        labelText: "Type your username",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8))),
                    controller: user,
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Type your password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8))),
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: password,
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: _checkLogin, child: Text("Login")),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      user.text = "";
                      password.text = "";
                    });
                  },
                  child: Text("Clean"))
            ],
          ),
        ],
      ),
    );
  }
}
