import 'package:flutter/material.dart';
import 'package:tecnico/RecogerCasa/RecogerCasa.dart';
import 'package:tecnico/TraerLocal/TraerLocal.dart';

void main() {
  runApp(SolitarFormateoScreen());
}

class SolitarFormateoScreen extends StatelessWidget {
  const SolitarFormateoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones de Entrega'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          RecogercasaScreen()), // Asegúrate de usar el nombre correcto de la clase
                );
              },
              child: Text('Recoger en mi casa'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          TraerlocalScreen()), // Asegúrate de usar el nombre correcto de la clase
                );
              },
              child: Text('Lo traigo al local'),
            ),
          ],
        ),
      ),
    );
  }
}
