import 'package:flutter/material.dart';
import 'nuevo_producto_screen.dart';

class ProductoInventario {
  final String nombre;
  final int cantidad;

  ProductoInventario({
    required this.nombre,
    required this.cantidad,
  });
}

class InventarioScreen extends StatelessWidget {
  // Lista de productos de ejemplo en el inventario
  final List<ProductoInventario> productosInventario = [
    ProductoInventario(nombre: 'Producto 1', cantidad: 100),
    ProductoInventario(nombre: 'Producto 2', cantidad: 50),
    ProductoInventario(nombre: 'Producto 3', cantidad: 30),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón para agregar un nuevo producto al inventario
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NuevoProductoScreen()),
                );
              },
              child: Text('Agregar Nuevo Producto'),
            ),
            SizedBox(height: 16),

            // Lista de productos en el inventario
            Expanded(
              child: ListView.builder(
                itemCount: productosInventario.length,
                itemBuilder: (context, index) {
                  final producto = productosInventario[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(producto.nombre),
                      subtitle: Text('Cantidad: ${producto.cantidad}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Lógica para editar el producto en el inventario
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Editar cantidad de ${producto.nombre}'),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Lógica para eliminar el producto del inventario
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Eliminar ${producto.nombre} del inventario'),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
