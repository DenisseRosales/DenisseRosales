import 'package:flutter/material.dart';

class GestionVentasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Ventas'),
      ),
      body: Center(
        child: Text(
          'Pantalla para gestionar ventas',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
