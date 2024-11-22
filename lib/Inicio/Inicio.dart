import 'package:flutter/material.dart';
import 'package:tecnico/CerrarSesion/CerrarSesion.dart';
import 'package:tecnico/Geolocalizacion/Geolocalizacion.dart';
import 'package:tecnico/Mantenimiento/Mantenimiento.dart';
import 'package:tecnico/RegistroUsuario/RegistroUsuario.dart';
import 'package:tecnico/SolicitarFormateo/SolicitarFormateo.dart';
import 'package:tecnico/SolicitarMantenimiento/SolicitarMantenimiento.dart';
import 'package:tecnico/VentanaInicio/VentanaInicio.dart';

class InicioApp extends StatelessWidget {
  const InicioApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Lista de productos con imágenes y nombres
    final List<Map<String, String>> products = [
      {
        "name": "Mantenimiento",
        "image":
            "https://media.gettyimages.com/id/489081568/es/foto/reparaci%C3%B3n-de-ordenadores.jpg?s=612x612&w=gi&k=20&c=nEGUN8bhWQGallB-IBCYrq2phumcFHtmOc844ZZRHsQ=",
        "detail": "Detalles del servicio de Mantenimiento"
      },
      {
        "name": "Formateo",
        "image":
            "data:image/png;base64,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",
        "detail": "Detalles del servicio de Formateo"
      },
    ];

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
              title: const Text('Geolocalización'),
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
              title: const Text('Cerrar Sesión'),
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
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ProductItem(
            name: products[index]["name"]!,
            imageUrl: products[index]["image"]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MantenimientoScreen(),
                ),
              );
            },
          );
          return ProductItem(
            name: products[index]["name"]!,
            imageUrl: products[index]["image"]!,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SolicitarmantenimientoScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final VoidCallback onTap;

  const ProductItem({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 80, fit: BoxFit.cover),
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

class ProductDetailScreen extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String detail;

  const ProductDetailScreen({
    super.key,
    required this.name,
    required this.imageUrl,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(imageUrl, height: 200, fit: BoxFit.cover),
            const SizedBox(height: 20.0),
            Text(
              name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10.0),
            Text(
              detail,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
