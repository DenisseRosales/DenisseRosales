import 'package:flutter/material.dart';

class NuevaVentaScreen extends StatefulWidget {
  @override
  _NuevaVentaScreenState createState() => _NuevaVentaScreenState();
}

class _NuevaVentaScreenState extends State<NuevaVentaScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _clienteController = TextEditingController();
  final TextEditingController _productoController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();

  @override
  void dispose() {
    // Liberar los controladores
    _clienteController.dispose();
    _productoController.dispose();
    _cantidadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva Venta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _clienteController,
                decoration: InputDecoration(
                  labelText: 'Cliente',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese el nombre del cliente';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _productoController,
                decoration: InputDecoration(
                  labelText: 'Producto',
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
                controller: _cantidadController,
                decoration: InputDecoration(
                  labelText: 'Cantidad',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese la cantidad';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor ingrese un número válido';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Venta registrada exitosamente')),
                    );
                    // Aquí puedes agregar lógica para registrar la venta
                  }
                },
                child: Text('Registrar Venta'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
