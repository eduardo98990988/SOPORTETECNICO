import 'package:flutter/material.dart';
import 'package:tecnico/CerrarSesion/CerrarSesion.dart';
import 'package:tecnico/Geolocalizacion/Geolocalizacion.dart';
import 'package:tecnico/RegistroUsuario/RegistroUsuario.dart';
import 'package:tecnico/VentanaInicio/VentanaInicio.dart';


class InicioApp extends StatelessWidget {
  const InicioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenido'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 3, 63, 112),
              ),
              child: Text(
                'Menú',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Inicio'),
              onTap: () {
                Navigator.pop(context); // Cierra el Drawer sin navegar.
              },
            ),
            ListTile(
              title: const Text('Soporte Técnico'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const VentanaInicioScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Geolocalizaion'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const GeolocalizacionScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('Registro de Usuario'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const RegistrousuarioScreen()),
                );
              },
            ),
            ListTile(
              title: const Text('CerrarSesion'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CerrarsesionScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
          childAspectRatio: 0.8,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return ProductItem(
            name: 'Producto ${index + 1}',
          );
        },
      ),
      // floatingActionButton: WhatsAppButton(phoneNumber: '913760751'), // Número de teléfono
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;

  const ProductItem({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 50, color: Colors.blue),
            const SizedBox(height: 10.0),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
