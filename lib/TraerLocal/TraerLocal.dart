import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TraerlocalScreen extends StatelessWidget {
  const TraerlocalScreen({super.key});
  // Función para abrir la dirección en el mapa
  Future<void> _launchURL() async {
    const String url =
        'https://www.google.com/maps/place/Jir%C3%B3n+Lima+2026,+Huancayo+12004/@-12.0772389,-75.22711,17z/data=!3m1!4b1!4m6!3m5!1s0x910e965df805411b:0x754596a3d3e1dc4c!8m2!3d-12.0772389!4d-75.2245351!16s%2Fg%2F11vjlx5xsj?entry=ttu&g_ep=EgoyMDI0MTExOS4yIKXMDSoJLDEwMjExMjMzSAFQAw%3D%3D';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'No se puede abrir el mapa';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Redirigir a Mapa'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: _launchURL,
          child: Text('Ver Dirección'),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: TraerlocalScreen(),
  ));
}
