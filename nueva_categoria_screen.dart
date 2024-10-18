import 'package:flutter/material.dart';

class NuevaCategoriaScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _categoriaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Categoría'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _categoriaController,
                decoration: InputDecoration(
                  labelText: 'Nombre de la categoría',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de la categoría';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Categoría guardada exitosamente')),
                    );
                  }
                },
                child: Text('Guardar Categoría'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
