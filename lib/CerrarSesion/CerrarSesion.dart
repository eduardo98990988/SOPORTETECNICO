import 'package:flutter/material.dart';
import 'package:tecnico/Login/Login.dart';

void main() {
  runApp(CerrarsesionScreen());
}

class CerrarsesionScreen extends StatelessWidget {
  const CerrarsesionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cerrar sesión',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cerrar sesión'),
          content: Text('¿Estás seguro de que deseas cerrar sesión?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(); // Cierra el diálogo
              },
            ),
            TextButton(
              child: Text('Cerrar sesión'),
              onPressed: () {
                // Aquí puedes agregar la lógica para cerrar sesión
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const InicioSesionScreen()),
                ); // Cierra el diálogo
                // Redirigir al login o realizar otra acción
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pantalla de inicio'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showLogoutDialog(context); // Muestra la ventana de cerrar sesión
          },
          child: Text('Cerrar sesión'),
        ),
      ),
    );
  }
}
