import 'package:flutter/material.dart';

class ReporteVentasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reporte de Ventas'),
      ),
      body: Center(
        child: Text(
          'Pantalla de reporte de ventas',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
