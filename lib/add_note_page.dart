import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  final Function(String, {int? index})
      onSave; // Función para guardar o editar la nota
  final String? initialNote; // Nota inicial (si existe)
  final bool isEditing; // Flag para indicar si estamos editando una nota
  final int? noteIndex; // Índice de la nota que estamos editando (si existe)

  const AddNotePage({
    super.key,
    required this.onSave,
    this.initialNote,
    this.isEditing = false,
    this.noteIndex,
  });

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.initialNote != null) {
      _controller.text = widget.initialNote!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isEditing ? 'Editar Nota' : 'Nueva Nota'),
        backgroundColor: const Color(0xFF4A5D37),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Escribe tu nota:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _controller,
              maxLines: 5,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Escribe aquí...',
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    widget.onSave(
                      _controller.text,
                      index: widget
                          .noteIndex, // Pasar el índice si estamos editando
                    );
                    Navigator.pop(context);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4A5D37),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text(
                  widget.isEditing ? 'Editar Nota' : 'Guardar Nota',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
