import 'package:flutter/material.dart';
import 'package:tecnico/CerrarSesion/CerrarSesion.dart';
import 'package:tecnico/GenerarTicket/GenerarTicket.dart';
import 'package:tecnico/Geolocalizacion/Geolocalizacion.dart';
import 'package:tecnico/Login/Login.dart';
import 'package:tecnico/RecogerCasa/RecogerCasa.dart';
import 'package:tecnico/RegistroUsuario/RegistroUsuario.dart';
import 'package:tecnico/ResetPasword/reset_pasword.dart';
import 'package:tecnico/SobreNosotros/SobreNosotros.dart';
import 'package:tecnico/SolicitarFormateo/SolicitarFormateo.dart';
import 'package:tecnico/SolicitarMantenimiento/SolicitarMantenimiento.dart';
import 'package:tecnico/TraerLocal/TraerLocal.dart';
import 'package:tecnico/VentanaInicio/VentanaInicio.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: 'home',
      routes: {
        'home': (context) => const InicioSesionScreen(),
        '/CerrarSesion': (context) => CerrarsesionScreen(),
        '/VentanaInicio': (context) => VentanaInicioScreen(),
        '/RegistraUsuario': (context) => RegistrousuarioScreen(),
        '/Geolocalizacion': (context) => GeolocalizacionScreen(),
        '/SobreNosotros': (context) => SobrenosotrosScreen(),
        '/solicitarMantenimiento': (context) => SolitarFormateoScreen(),
        '/SolicitarFormateo': (context) => SolicitarmantenimientoScreen(),
        '/GenerarTicket': (context) => GenerateTicketPage(),
        '/ResetPasword ': (context) => EstablecerNuevaContrasenaScreen(),
        '/RecojoCasa': (context) => RecogercasaScreen(),
        '/TraerLocal': (context) => TraerlocalScreen()
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
