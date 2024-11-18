import 'package:flutter/material.dart';
import 'package:tecnico/ConcatarSoporte/Contactar.dart';
import 'package:tecnico/GenerarTicket/GenerarTicket.dart';
import 'package:tecnico/Login/Login.dart';

class VentanaInicioScreen extends StatelessWidget {
  const VentanaInicioScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Área de Soporte Técnico'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Bienvenido al área de soporte técnico',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            Text(
              '¿Qué deseas hacer?',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => GenerateTicketPage()),
                );
                // Acción para abrir tickets de soporte
              },
              child: Text('Generar Ticket'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción para ver tickets pendientes
              },
              child: Text('Ver Tickets Pendientes'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Acción para contactar soporte
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const ContactApp()),
                );
              },
              child: Text('Enviar Mensaje'),
            ),
          ],
        ),
      ),
    );
  }
}
