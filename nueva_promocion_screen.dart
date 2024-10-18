import 'package:flutter/material.dart';

class NuevaPromocionScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nombrePromocionController =
      TextEditingController();
  final TextEditingController _descuentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Promoción'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nombrePromocionController,
                decoration: InputDecoration(
                  labelText: 'Nombre de la promoción',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre de la promoción';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _descuentoController,
                decoration: InputDecoration(
                  labelText: 'Descuento (%)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el porcentaje de descuento';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Promoción creada exitosamente')),
                    );
                  }
                },
                child: Text('Crear Promoción'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
