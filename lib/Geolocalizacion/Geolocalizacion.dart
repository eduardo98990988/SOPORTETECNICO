import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class GeolocalizacionScreen extends StatefulWidget {
  const GeolocalizacionScreen({super.key});
  @override
  _GeolocalizacionScreenState createState() => _GeolocalizacionScreenState();
}

class _GeolocalizacionScreenState extends State<GeolocalizacionScreen> {
  String _ubicacion = "Presiona el botón para obtener tu ubicación";

  // Método para obtener la ubicación actual
  Future<void> obtenerUbicacion() async {
    try {
      // Verifica los permisos de ubicación
      LocationPermission permiso = await Geolocator.checkPermission();
      if (permiso == LocationPermission.denied) {
        permiso = await Geolocator.requestPermission();
        if (permiso == LocationPermission.denied) {
          setState(() {
            _ubicacion = "Permiso de ubicación denegado";
          });
          return;
        }
      }

      if (permiso == LocationPermission.deniedForever) {
        setState(() {
          _ubicacion = "Permiso de ubicación permanentemente denegado";
        });
        return;
      }

      // Obtiene la posición actual
      Position posicion = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      setState(() {
        _ubicacion =
            "Latitud: ${posicion.latitude}, Longitud: ${posicion.longitude}";
      });
    } catch (e) {
      setState(() {
        _ubicacion = "Error al obtener ubicación: $e";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Geolocalización'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _ubicacion,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: obtenerUbicacion,
              child: Text('Obtener Ubicación'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GeolocalizacionScreen(),
    ));
