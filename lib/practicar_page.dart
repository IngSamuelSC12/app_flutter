import 'package:flutter/material.dart';
import 'package:learnify/test_page.dart';


class PracticarPage extends StatefulWidget {
  const PracticarPage({super.key});

  @override
  _PracticarPageState createState() => _PracticarPageState();
}

class _PracticarPageState extends State<PracticarPage> {
  final TextEditingController _controller = TextEditingController(); // Controlador para el campo de texto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practicar'),
        backgroundColor: const Color(0xFF4A5D37),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ingresa información:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: null, // Permite varias líneas
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Pega tu texto aquí...',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    // Al presionar, redirigir a la siguiente página
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TestPage(
                         // inputText: _controller.text, // Pasa el texto ingresado
                        ),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A5D37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Generar Preguntas',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
