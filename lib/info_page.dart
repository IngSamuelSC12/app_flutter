import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre nosotros'),
        backgroundColor: const Color(0xFF4A5D37),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: const Color(0xFF4A5D37),
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Sobre nosotros',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            Image.asset(
              'assets/images/imagen_info.jpg', // Asegúrate de que la imagen esté en esta ruta
              height: 150,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Hemos creado esta app con el fin de que los alumnos puedan tener un espacio donde realizar notas y puedan estudiar de una manera eficiente en un solo lugar.\n\n'
                'Nuestro objetivo es que esos alumnos que sienten que estudiar es una actividad pesada puedan tener todas las herramientas a la mano.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              color: const Color(0xFF4A5D37),
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Contáctanos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'madylopez91@gmail.com\ning.samuel.1207@gmail.com',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.facebook),
                  color: Colors.blue,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.xTwitter),
                  color: Colors.black,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp),
                  color: Colors.green,
                  onPressed: () {},
                ),
                IconButton(
                  icon: const FaIcon(FontAwesomeIcons.instagram),
                  color: Colors.pink,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF333333), // Fondo de la pantalla
    );
  }
}
