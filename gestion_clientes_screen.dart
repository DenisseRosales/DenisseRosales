import 'package:flutter/material.dart';
import 'nuevo_cliente_screen.dart';

class Cliente {
  final String nombre;
  final String email;

  Cliente({
    required this.nombre,
    required this.email,
  });
}

class GestionClientesScreen extends StatelessWidget {
  // Lista de clientes de ejemplo
  final List<Cliente> clientes = [
    Cliente(nombre: 'Cliente 1', email: 'cliente1@email.com'),
    Cliente(nombre: 'Cliente 2', email: 'cliente2@email.com'),
    Cliente(nombre: 'Cliente 3', email: 'cliente3@email.com'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Clientes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botón para agregar un nuevo cliente
            ElevatedButton(
              onPressed: () {
                // Lógica para navegar a la pantalla de nuevo cliente
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NuevoClienteScreen()),
                );
              },
              child: Text('Agregar Nuevo Cliente'),
            ),
            SizedBox(height: 16),

            // Lista de clientes
            Expanded(
              child: ListView.builder(
                itemCount: clientes.length,
                itemBuilder: (context, index) {
                  final cliente = clientes[index];
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(cliente.nombre),
                      subtitle: Text('Email: ${cliente.email}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // Lógica para editar el cliente
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Editar ${cliente.nombre}'),
                                ),
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              // Lógica para eliminar el cliente
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Eliminar ${cliente.nombre}'),
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
