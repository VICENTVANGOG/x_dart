import 'package:flutter/material.dart';
import 'package:x/pages/home.dart';

class XLoginScreen extends StatelessWidget {
  const XLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'X',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 30),
              const Text(
                'Inicia sesión en X',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, height: 1.2),
              ),
              const SizedBox(height: 40),
              _buildSignUpButton(context, 'Iniciar sesión como Jose Miguel', Icons.person, Home()),
              const SizedBox(height: 15),
              _buildDecorativeButton('Iniciar sesión con Apple', Icons.apple),
              const SizedBox(height: 15),
              _buildDivider(),
              const SizedBox(height: 15),
              _buildTextField(),
              const SizedBox(height: 15),
              _buildDecorativeButton('Siguiente', null),
              const SizedBox(height: 15),
              _buildDecorativeButton('¿Olvidaste tu contraseña?', null, outlined: true),
              const Text(
                '¿No tienes una cuenta?',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              Text(
                'Regístrate',
                style: TextStyle(color: Color(0xFF1D9BF0), fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpButton(BuildContext context, String text, IconData icon, Widget destinationPage) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.black, size: 20),
            const SizedBox(width: 8),
            Text(text, style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => destinationPage),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.black,
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildDecorativeButton(String text, IconData? icon, {bool outlined = false}) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) Icon(icon, color: outlined ? const Color.fromARGB(255, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255), size: 20),
            if (icon != null) const SizedBox(width: 8),
            Text(text, style: TextStyle(color: outlined ? Colors.white : const Color.fromARGB(255, 255, 255, 255), fontSize: 15, fontWeight: FontWeight.bold)),
          ],
        ),
        onPressed: null, 
        style: ElevatedButton.styleFrom(
          foregroundColor: outlined ? Colors.white : Colors.black,
          backgroundColor: outlined ? const Color.fromARGB(0, 255, 255, 255) : const Color.fromARGB(255, 255, 255, 255),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
            side: outlined ? BorderSide(color: Colors.grey) : BorderSide.none,
          ),
          padding: const EdgeInsets.symmetric(vertical: 12),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        Expanded(child: Divider(color: const Color.fromARGB(255, 255, 255, 255))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'o',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Expanded(child: Divider(color: Colors.grey)),
      ],
    );
  }

  Widget _buildTextField() {
    return TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Teléfono, correo electrónico o nombre de usuario',
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: BorderSide(color: Color(0xFF1D9BF0)),
        ),
      ),
    );
  }
}

