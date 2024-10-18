// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import '../screen/nuevo_cliente_screen.dart';
import '../screen/gestion_clientes_screen.dart';
import '../screen/inventario_screen.dart';
import '../screen/nuevo_producto_screen.dart';
import '../screen/gestion_productos_screen.dart';
import '../screen/nueva_categoria_screen.dart';
import '../screen/reporte_ventas_screen.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 113, 18, 168),
            ),
            child: Text(
              'Menú',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          _crearListTile(
              context, Icons.person, 'Nuevo Cliente', NuevoClienteScreen()),
          _crearListTile(context, Icons.list, 'Gestión de Clientes',
              GestionClientesScreen()),
          _crearListTile(
              context, Icons.store, 'Inventario', InventarioScreen()),
          _crearListTile(context, Icons.local_offer, 'Nuevo Producto',
              NuevoProductoScreen()),
          _crearListTile(context, Icons.list_alt, 'Gestión de Productos',
              GestionProductosScreen()),
          _crearListTile(context, Icons.category, 'Nueva Categoría',
              NuevaCategoriaScreen()),
          _crearListTile(
              context, Icons.report, 'Reporte Ventas', ReporteVentasScreen()),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Cerrar Sesión'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  ListTile _crearListTile(
      BuildContext context, IconData icon, String title, Widget destination) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => destination),
        );
      },
    );
  }
}
