import 'package:flutter/material.dart';

class GestionPromocionesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gestión de Promociones'),
      ),
      body: Center(
        child: Text(
          'Pantalla para gestionar promociones',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
