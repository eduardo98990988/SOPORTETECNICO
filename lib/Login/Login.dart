import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:tecnico/Inicio/Inicio.dart';
import 'package:tecnico/ResetPasword/reset_pasword.dart';

final usuarioCtrl = TextEditingController();
final contraCtrl = TextEditingController();
final formKey = GlobalKey<FormState>();

class InicioSesionScreen extends StatelessWidget {
  const InicioSesionScreen({super.key});

  Future<void> sendPostRequest(email, password) async {
    var response = await http.post(Uri.parse("PONER URL DEL BACKEND"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "password": password}));

    if (response.statusCode == 200) {
      print("Éxito al iniciar sesión");
    } else {
      print("Error en la solicitud");
    }
  }

  Future<void> submitData(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      print("Formulario válido");
      print(usuarioCtrl.text);
      print(contraCtrl.text);
      await sendPostRequest(usuarioCtrl.text, contraCtrl.text);

      // Redirigir a InicioApp
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const InicioApp()),
      );
    } else {
      print("Formulario inválido");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.network(
                    'https://png.pngtree.com/png-clipart/20230921/original/pngtree-logo-for-tech-support-support-tool-black-vector-png-image_12815543.png',
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    return (value != null && value.isEmpty)
                        ? 'Por favor ingrese el correo'
                        : null;
                  },
                  controller: usuarioCtrl,
                  decoration: InputDecoration(
                    hintText: 'Ingrese correo',
                    labelText: 'Correo*',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  validator: (String? value) {
                    return (value != null && value.isEmpty)
                        ? 'Por favor ingrese la contraseña'
                        : null;
                  },
                  controller: contraCtrl,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Ingrese contraseña',
                    labelText: 'Contraseña*',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    await submitData(context); // Manejo completo en submitData
                  },
                  child: Text(
                    'INGRESAR',
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 33, 243, 145),
                    padding:
                        EdgeInsets.symmetric(horizontal: 100, vertical: 20),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const EstablecerNuevaContrasenaScreen()),
                      );
                    },
                    child: Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
