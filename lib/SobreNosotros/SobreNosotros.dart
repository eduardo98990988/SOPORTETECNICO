import 'package:flutter/material.dart';

class SobrenosotrosScreen extends StatelessWidget {
  const SobrenosotrosScreen({super.key}); // Se agregó el punto y coma

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre Nosotros'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Acerca del Área de Soporte Técnico',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'En el Área de Soporte Técnico, nos dedicamos a brindar soluciones rápidas, efectivas y personalizadas '
              'para satisfacer las necesidades tecnológicas de nuestros clientes. Nuestro equipo está compuesto por '
              'profesionales altamente capacitados que trabajan con compromiso y dedicación.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              'Nuestros Servicios:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '- Resolución de problemas técnicos.\n'
              '- Instalación y configuración de software.\n'
              '- Mantenimiento preventivo y correctivo.\n'
              '- Asesoría tecnológica personalizada.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
            SizedBox(height: 16),
            Text(
              'Contáctanos para obtener soporte técnico confiable y de alta calidad. Estamos aquí para ayudarte a '
              'maximizar el rendimiento de tus herramientas tecnológicas.',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ],
        ),
      ),
    );
  }
}
