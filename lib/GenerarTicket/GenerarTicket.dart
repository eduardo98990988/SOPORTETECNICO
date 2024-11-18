import 'package:flutter/material.dart';

class GenerateTicketPage extends StatefulWidget {
  const GenerateTicketPage({super.key});

  @override
  _GenerateTicketPageState createState() => _GenerateTicketPageState();
}

class _GenerateTicketPageState extends State<GenerateTicketPage> {
  final TextEditingController subjectController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  String? selectedPriority;

  @override
  void dispose() {
    subjectController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Generar Ticket de Soporte'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Asunto:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: subjectController,
              decoration: const InputDecoration(
                hintText: 'Ingrese el asunto del ticket',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Descripción del problema:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: descriptionController,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Describa el problema...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Prioridad:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            DropdownButtonFormField<String>(
              value: selectedPriority,
              items: ['Alta', 'Media', 'Baja']
                  .map(
                    (priority) => DropdownMenuItem(
                      value: priority,
                      child: Text(priority),
                    ),
                  )
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedPriority = value;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final subject = subjectController.text;
                  final description = descriptionController.text;

                  if (subject.isEmpty ||
                      description.isEmpty ||
                      selectedPriority == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Por favor complete todos los campos'),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Ticket enviado con éxito'),
                      ),
                    );

                    // Limpiar campos tras enviar
                    subjectController.clear();
                    descriptionController.clear();
                    setState(() {
                      selectedPriority = null;
                    });
                  }
                },
                child: const Text('Enviar Ticket'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: GenerateTicketPage(),
  ));
}
