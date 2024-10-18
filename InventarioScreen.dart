import 'package:flutter/material.dart';

class InventarioScreen extends StatelessWidget {
  // Lista de productos de ejemplo en el inventario
  final List<Producto> productos = [
    Producto(
        nombre: 'Producto 1',
        categoria: 'Categoría A',
        precio: 10.0,
        cantidad: 100),
    Producto(
        nombre: 'Producto 2',
        categoria: 'Categoría B',
        precio: 20.0,
        cantidad: 50),
    Producto(
        nombre: 'Producto 3',
        categoria: 'Categoría A',
        precio: 15.0,
        cantidad: 30),
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
            // Lista de productos en el inventario
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (context, index) {
                  final producto = productos[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(producto.nombre),
                      subtitle: Text(
                          'Categoría: ${producto.categoria}\nPrecio: \$${producto.precio}\nCantidad: ${producto.cantidad}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Lógica para editar el producto en el inventario
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text('Editar ${producto.nombre}')),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Lógica para eliminar el producto del inventario
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content:
                                        Text('Eliminar ${producto.nombre}')),
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

class Producto {
  final String nombre;
  final String categoria;
  final double precio;
  final int cantidad;

  Producto({
    required this.nombre,
    required this.categoria,
    required this.precio,
    required this.cantidad,
  });
}
