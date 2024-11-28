import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  // Lista de preguntas y respuestas sobre programación
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '¿Qué es un lenguaje de programación?',
      'options': [
        'Un conjunto de instrucciones',
        'Un tipo de computadora',
        'Una base de datos',
        'Un sistema operativo'
      ],
      'answer': 'Un conjunto de instrucciones',
    },
    {
      'question': '¿Qué hace la función `print()` en Python?',
      'options': [
        'Muestra un mensaje en consola',
        'Crea una variable',
        'Detiene el programa',
        'Realiza cálculos'
      ],
      'answer': 'Muestra un mensaje en consola',
    },
    {
      'question': '¿Qué significa HTML?',
      'options': [
        'HyperText Markup Language',
        'Hyper Tool Markup Language',
        'Home Tool Markup Language',
        'Hyperlinks Markup Language'
      ],
      'answer': 'HyperText Markup Language',
    },
    {
      'question': '¿Cuál es el propósito de un bucle `for`?',
      'options': [
        'Repetir un conjunto de instrucciones',
        'Crear una variable',
        'Terminar un programa',
        'Detectar errores en el código'
      ],
      'answer': 'Repetir un conjunto de instrucciones',
    },
    {
      'question': '¿Qué es un array en programación?',
      'options': [
        'Una colección de elementos',
        'Una variable única',
        'Un tipo de función',
        'Un tipo de condicional'
      ],
      'answer': 'Una colección de elementos',
    },
  ];

  // Lista para guardar las respuestas del usuario
  final List<String?> _userAnswers = List.generate(5, (index) => null);

  // Controlador para revisar las respuestas
  void _checkAnswers() {
    int correctAnswers = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_userAnswers[i] == _questions[i]['answer']) {
        correctAnswers++;
      }
    }

    // Mostrar un diálogo con el resultado
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Resultado'),
        content:
            Text('Respondiste correctamente $correctAnswers de 5 preguntas.'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cerrar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test de Programación'),
        backgroundColor: const Color(0xFF4A5D37), // Barra verde
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Responde las siguientes preguntas sobre programación:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Mostrar las preguntas y opciones
            Expanded(
              child: ListView.builder(
                itemCount: _questions.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _questions[index]['question'],
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 8),
                          ..._questions[index]['options'].map<Widget>((option) {
                            return RadioListTile<String>(
                              title: Text(option),
                              value: option,
                              groupValue: _userAnswers[index],
                              onChanged: (value) {
                                setState(() {
                                  _userAnswers[index] = value;
                                });
                              },
                            );
                          }).toList(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            // Botón para comprobar las respuestas
            Center(
              child: ElevatedButton(
                onPressed: _checkAnswers,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A5D37), // Botón verde
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Text(
                  'Ver Resultado',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
