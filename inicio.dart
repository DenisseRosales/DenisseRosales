import 'package:flutter/material.dart';

class TiendaAbarrotesLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 138, 114, 206), Color(0xFF2978B5)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 60),
            Image.asset(
              'assets/images/shopping_cart.png', // Reemplaza con la ruta de tu imagen
              height: 150,
            ),
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
                // Acción de iniciar sesión
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
            Image.asset(
              'assets/images/cashier.png', // Reemplaza con la ruta de tu imagen
              height: 180,
            ),
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
