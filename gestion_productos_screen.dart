import 'package:flutter/material.dart';
import 'nuevo_producto_screen.dart';

class Producto {
  final String nombre;
  final double precio;

  Producto({required this.nombre, required this.precio});
}

class GestionProductosScreen extends StatefulWidget {
  @override
  _GestionProductosScreenState createState() => _GestionProductosScreenState();
}

class _GestionProductosScreenState extends State<GestionProductosScreen> {
  final List<Producto> _productos = [];
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _precioController = TextEditingController();

  void _agregarProducto() {
    final String nombre = _nombreController.text.trim();
    final String precioStr = _precioController.text.trim();

    if (nombre.isEmpty || precioStr.isEmpty) {
      // Mostrar un SnackBar si los campos están vacíos
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor completa todos los campos.')),
      );
      return;
    }

    final double? precio = double.tryParse(precioStr);
    if (precio == null || precio <= 0) {
      // Validar que el precio sea un número positivo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Por favor ingresa un precio válido.')),
      );
      return;
    }

    setState(() {
      _productos.add(Producto(nombre: nombre, precio: precio));
    });
    _nombreController.clear();
    _precioController.clear();
    Navigator.of(context).pop(); // Cierra el formulario

    // Mostrar un SnackBar de confirmación
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Producto agregado exitosamente.')),
    );
  }

  void _mostrarFormulario() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre del producto'),
              ),
              TextField(
                controller: _precioController,
                decoration: InputDecoration(labelText: 'Precio'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _agregarProducto,
                child: Text('Agregar Producto'),
              ),
            ],
          ),
        );
      },
    );
  }

  void _eliminarProducto(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Eliminar Producto'),
          content: Text('¿Estás seguro de que deseas eliminar este producto?'),
          actions: [
            TextButton(
              onPressed: () {
                setState(() {
                  _productos.removeAt(index);
                });
                Navigator.of(context).pop(); // Cerrar el diálogo
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Producto eliminado exitosamente.')),
                );
              },
              child: Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Cerrar el diálogo
              },
              child: Text('No'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Productos'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _mostrarFormulario,
          ),
        ],
      ),
      body: _productos.isEmpty
          ? Center(child: Text('No hay productos. Agrega uno.'))
          : ListView.builder(
              itemCount: _productos.length,
              itemBuilder: (context, index) {
                final producto = _productos[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(producto.nombre),
                    subtitle: Text('\$${producto.precio.toStringAsFixed(2)}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _eliminarProducto(index),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
