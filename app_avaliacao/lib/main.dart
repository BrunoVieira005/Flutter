import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyA|App extends StatelessWidget {
  const MyApp({super.key});
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              ''
            ),
            Text(
              '',
            ),
          ],
        ),
      ),
    );
  }
}
