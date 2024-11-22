import 'package:flutter/material.dart';
import 'package:x/pages/home.dart';


void main() => runApp(const MiApp());

class MiApp extends StatelessWidget {
  const MiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "mi app",
      home: Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Cuerpo(context),
    );
  }
}

Widget Cuerpo(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.black,
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Nombre(),
          campoUsuario(),
          passwordCampus(),
          SizedBox(
            height: 10.0,
          ),
          buttonEntrar(context),
        ],
      ),
    ),
  );
}

Widget Nombre() {
  return Text(
    "sign in",
    style: TextStyle(
        color: Colors.white, fontSize: 35.0, fontWeight: FontWeight.bold),
  );
}

Widget campoUsuario() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: TextField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Usuario",
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.person, color: Colors.white),
        filled: true,
        fillColor: const Color.fromARGB(31, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}

Widget passwordCampus() {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
    child: TextField(
      obscureText: true,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: "Contraseña",
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.lock, color: Colors.white),
        filled: true,
        fillColor: const Color.fromARGB(31, 255, 255, 255),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}


Widget buttonEntrar(BuildContext context) {
  return TextButton(
    style: TextButton.styleFrom(
      foregroundColor: Colors.black,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      padding: EdgeInsets.symmetric(horizontal: 100, vertical: 10),
    ),
    onPressed: () {
    
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    },
    child: Text("Entrar"),
  );
}

