import 'package:flutter/material.dart';
import 'package:learnify/user_page.dart'; // Importa la página de Notas
import 'package:table_calendar/table_calendar.dart'; // Importar el paquete del calendario
import 'practicar_page.dart'; // Importa la nueva página PracticarPage

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        backgroundColor: const Color(0xFF4A5D37), // Barra verde
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Calendario
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: TableCalendar(
                focusedDay: DateTime.now(),
                firstDay: DateTime.utc(2020, 01, 01),
                lastDay: DateTime.now().add(const Duration(
                    days: 365)), // Fecha de un año después de hoy
                onDaySelected: (selectedDay, focusedDay) {
                  // Acción cuando seleccionas un día
                },
              ),
            ),
            // Pregunta "¿Qué quieres hacer hoy?"
            const Text(
              '¿Qué quieres hacer hoy?',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
                height: 16), // Espacio entre la pregunta y los botones
            // Center para centrar los botones
            Center(
              child: Column(
                children: [
                  // Botón "Tomar Notas"
                  ElevatedButton(
                    onPressed: () {
                      // Acción al hacer clic en "Tomar Notas"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const UserPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A5D37), // Botón verde
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Tomar Notas',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 8), // Espacio entre botones
                  // Botón "Practicar"
                  ElevatedButton(
                    onPressed: () {
                      // Acción al hacer clic en "Practicar"
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PracticarPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A5D37), // Botón verde
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                    ),
                    child: const Text(
                      'Practicar',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
