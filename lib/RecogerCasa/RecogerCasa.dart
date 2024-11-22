import 'package:flutter/material.dart';

void main() => runApp(RecogercasaScreen());

class RecogercasaScreen extends StatelessWidget {
  const RecogercasaScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RecojoForm(),
    );
  }
}

class RecojoForm extends StatefulWidget {
  @override
  _RecojoFormState createState() => _RecojoFormState();
}

class _RecojoFormState extends State<RecojoForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _referenciaController = TextEditingController();
  final TextEditingController _celularController = TextEditingController();
  final TextEditingController _ubicacionController = TextEditingController();
  final TextEditingController _distritoController = TextEditingController();

  double precioBase = 50.0; // Precio base
  double precioFinal = 0.0; // Precio con incremento de 20 soles

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario de Recojo a Casa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // Campo para la referencia
              TextFormField(
                controller: _referenciaController,
                decoration: InputDecoration(labelText: 'Referencia'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una referencia';
                  }
                  return null;
                },
              ),
              // Campo para el número de celular
              TextFormField(
                controller: _celularController,
                decoration: InputDecoration(labelText: 'Número de Celular'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un número de celular';
                  }
                  return null;
                },
              ),
              // Campo para la ubicación
              TextFormField(
                controller: _ubicacionController,
                decoration: InputDecoration(labelText: 'Ubicación'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una ubicación';
                  }
                  return null;
                },
              ),
              // Campo para el distrito
              TextFormField(
                controller: _distritoController,
                decoration: InputDecoration(labelText: 'Distrito'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un distrito';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              // Mostrar el precio final
              Text(
                'Precio final: S/ ${precioFinal.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              // Botón para calcular y enviar
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      // Calcular el precio final
                      precioFinal = precioBase + 20.0; // Aumento de 20 soles
                    });
                    // Aquí puedes agregar la lógica para enviar los datos al backend o realizar más acciones
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Formulario enviado')));
                  }
                },
                child: Text('Enviar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
