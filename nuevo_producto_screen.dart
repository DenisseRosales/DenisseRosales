import 'package:flutter/material.dart';

class NuevoProductoScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nuevo Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(
                  labelText: 'Nombre del producto',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del producto';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _precioController,
                decoration: InputDecoration(
                  labelText: 'Precio',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el precio';
                  }
                  final num? parsedValue = num.tryParse(value);
                  if (parsedValue == null || parsedValue <= 0) {
                    return 'Ingrese un número válido y mayor que cero';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Mostrar mensaje de éxito
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Producto guardado exitosamente')),
                    );

                    // Limpiar los campos
                    _nombreController.clear();
                    _precioController.clear();
                  }
                },
                child: Text('Guardar Producto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
