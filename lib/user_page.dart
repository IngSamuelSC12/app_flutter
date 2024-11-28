import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importa SharedPreferences
import 'add_note_page.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  List<String> notes = []; // Lista para almacenar las notas

  @override
  void initState() {
    super.initState();
    _loadNotes(); // Cargar las notas al iniciar
  }

  // Función para cargar las notas desde SharedPreferences
  _loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      notes = prefs.getStringList('notes') ?? [];
    });
  }

  // Función para guardar las notas en SharedPreferences
  _saveNotes() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('notes', notes);
  }

  // Función para agregar o editar una nota
  void _addNote(String note, {int? index}) {
    setState(() {
      if (index != null) {
        notes[index] = note; // Si es edición, reemplaza la nota existente
      } else {
        notes.add(note); // Si no, agrega una nueva nota
      }
      _saveNotes(); // Guarda las notas después de modificarlas
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NOTAS'),
        backgroundColor: const Color(0xFF4A5D37),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  String note = notes[index];
                  String preview =
                      note.length > 30 ? note.substring(0, 30) + "..." : note;

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddNotePage(
                            onSave: _addNote,
                            initialNote: note,
                            isEditing: true,
                            noteIndex: index, // Pasar el índice para editar
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: const Color(0xFF4A5D37),
                          width: 2,
                        ),
                      ),
                      child: Text(preview),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddNotePage(onSave: _addNote),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A5D37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
