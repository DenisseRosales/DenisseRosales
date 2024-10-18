// ignore_for_file: unused_import, use_key_in_widget_constructors, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_puntodeventa/widgets/drawer_menu_screen.dart';
import 'drawer_menu_screen.dart'; // Importamos la clase que contiene el DrawerMenu

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tienda de Abarrotes',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: TiendaAbarrotesLogin(), // Pantalla de inicio de sesión
      debugShowCheckedModeBanner: false,
    );
  }
}

class TiendaAbarrotesLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF54BAB9), Color(0xFF2978B5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            // Se eliminó la imagen aquí
            SizedBox(height: 20),
            Text(
              'Tienda de abarrotes',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            _crearCampoTexto('USUARIO'),
            _crearCampoTexto('CONTRASEÑA', esContrasena: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Navegamos a la pantalla que contiene el DrawerMenu
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DrawerMenuScreen()),
                );
              },
              child: Text('INICIAR SESIÓN'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFD49AD2),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Spacer(),
            // Se eliminó la imagen aquí
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _crearCampoTexto(String label, {bool esContrasena = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      child: TextField(
        obscureText: esContrasena,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(
            color: Color(0xFFF4D03F),
            fontWeight: FontWeight.bold,
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
