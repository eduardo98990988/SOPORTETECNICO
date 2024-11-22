import 'package:flutter/material.dart';
import 'package:tecnico/SolicitarMantenimiento/SolicitarMantenimiento.dart';

void main() => runApp(MantenimientoScreen());

class MantenimientoScreen extends StatelessWidget {
  const MantenimientoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mantenimiento de Computadoras',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MantenimientoPage(),
    );
  }
}

class MantenimientoPage extends StatelessWidget {
  void _solicitarServicio(BuildContext context) {
    // Aquí puedes agregar lógica para redirigir a otra pantalla o mostrar un mensaje
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Servicio solicitado')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mantenimiento de Computadoras'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mantenimiento de Computadoras',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Ofrecemos servicios de mantenimiento para computadoras. Esto incluye limpieza, revisión de hardware, y optimización de software.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Precio: \S/50 por servicio.',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SolicitarmantenimientoScreen()),
                );
              },
              child: Text('Solicitar Servicio'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Color del botón
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                textStyle: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
