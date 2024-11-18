import 'package:flutter/material.dart';

class EstablecerNuevaContrasenaScreen extends StatefulWidget {
  const EstablecerNuevaContrasenaScreen({super.key});
  @override
  _EstablecerNuevaContrasenaScreenState createState() =>
      _EstablecerNuevaContrasenaScreenState();
}

class _EstablecerNuevaContrasenaScreenState
    extends State<EstablecerNuevaContrasenaScreen> {
  final TextEditingController nuevaContraController = TextEditingController();
  final TextEditingController confirmarContraController =
      TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> cambiarContrasena() async {
    if (formKey.currentState!.validate()) {
      // Aquí harías la lógica para cambiar la contraseña
      String nuevaContrasena = nuevaContraController.text;

      // Simulación de un proceso para cambiar la contraseña
      await Future.delayed(Duration(seconds: 2));

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Contraseña cambiada exitosamente')),
      );

      Navigator.pop(context); // Regresa al inicio o a la pantalla anterior
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Establecer Nueva Contraseña'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: nuevaContraController,
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la nueva contraseña';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Nueva Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: confirmarContraController,
                obscureText: true,
                validator: (value) {
                  if (value != nuevaContraController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  labelText: 'Confirmar Contraseña',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: cambiarContrasena,
                child: Text('Cambiar Contraseña'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
