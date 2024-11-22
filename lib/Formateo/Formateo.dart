import 'package:flutter/material.dart';
import 'package:tecnico/SolicitarFormateo/SolicitarFormateo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormateoScreen(),
    );
  }
}

class FormateoScreen extends StatefulWidget {
  @override
  _FormateoScreenState createState() => _FormateoScreenState();
}

class _FormateoScreenState extends State<FormateoScreen> {
  final _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formateo de Computadoras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Precio del servicio',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String price = _priceController.text;
                if (price.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SolitarFormateoScreen(),
                    ),
                  );
                }
              },
              child: Text('Solicitar Servicio'),
            ),
          ],
        ),
      ),
    );
  }
}

class SolicitarServicioScreen extends StatelessWidget {
  final String price;

  SolicitarServicioScreen({required this.price});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Solicitud de Servicio'),
      ),
      body: Center(
        child: Text(
          'Servicio de formateo solicitado\nPrecio: \S/${price}',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
