import 'package:flutter/material.dart';
import 'info_page.dart'; // Importa el archivo info_page.dart
import 'registro_page.dart'; // Importa el archivo de la nueva página de registro
import 'login_page.dart'; // Importa la página de inicio de sesión
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(
          255, 174, 171, 110), // Color de fondo similar al de la imagen
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Imagen del logo
                Container(
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: const Color(
                        0xFF4A5D37), // Color verde del fondo del logo
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Image.asset(
                    'assets/images/logo_app.png',
                    height: 100, // Ajusta el tamaño según lo necesites
                  ),
                ),
                const SizedBox(height: 24), // Espacio entre logo y texto
                // Texto de bienvenida
                const Text(
                  'BIENVENIDO',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16), // Espacio entre texto y botones
                // Botón de INICIAR SESIÓN
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la página de INICIAR SESIÓN
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF4A5D37), // Color verde de los botones
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'INICIAR SESIÓN',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 8), // Espacio entre los botones
                // Botón de REGISTRARSE
                ElevatedButton(
                  onPressed: () {
                    // Navegar a la página de registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistroPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        const Color(0xFF4A5D37), // Color verde de los botones
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12),
                  ),
                  child: const Text(
                    'REGISTRARSE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          // Botón de información en la esquina superior derecha
          Positioned(
            top: 16,
            right: 16,
            child: IconButton(
              icon: const Icon(Icons.info_outline),
              color: Colors.black,
              onPressed: () {
                // Navegar a la página de información
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfoPage()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
