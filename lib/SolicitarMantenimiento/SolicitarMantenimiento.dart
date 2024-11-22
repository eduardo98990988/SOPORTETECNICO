import 'package:flutter/material.dart';
import 'package:tecnico/RecogerCasa/RecogerCasa.dart';
import 'package:tecnico/TraerLocal/TraerLocal.dart';

void main() {
  runApp(SolicitarmantenimientoScreen());
}

class SolicitarmantenimientoScreen extends StatelessWidget {
  const SolicitarmantenimientoScreen({super.key});
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
                  MaterialPageRoute(builder: (context) => RecogercasaScreen()),
                );
              },
              child: Text('Recoger en mi casa'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => TraerlocalScreen()),
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

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recoger en mi casa'),
      ),
      body: Center(
        child: Text('Aquí es donde el usuario recoge el pedido en su casa.'),
      ),
    );
  }
}

class StoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lo traigo al local'),
      ),
      body: Center(
        child: Text('Aquí es donde el usuario trae el pedido al local.'),
      ),
    );
  }
}
