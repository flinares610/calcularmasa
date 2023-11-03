import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: CalculoMasa(),
    debugShowCheckedModeBanner: false,
  ));
}

class CalculoMasa extends StatefulWidget {
  const CalculoMasa({super.key});

  @override
  State<CalculoMasa> createState() => _CalculoMasaState();
}

class _CalculoMasaState extends State<CalculoMasa> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Calcular masa"),
      ),
      body: Column(
        children: [
          Text("sadsadsa"),
        ],
      ),
    ));
  }
}
