import 'package:flutter/material.dart';

import 'nuevo_cliente_screen.dart';
import 'gestion_clientes_screen.dart';
import 'inventario_screen.dart';
import 'nuevo_producto_screen.dart';
import 'gestion_productos_screen.dart';
import 'nueva_categoria_screen.dart';
import 'reporte_ventas_screen.dart';
import '../widgets/drawer_menu.dart';

class OpcionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Opciones'),
      ),
      drawer: DrawerMenu(),
      body: Center(
        child: Text(
          'Contenido Principal',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
