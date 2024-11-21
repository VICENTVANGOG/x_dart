import 'package:flutter/material.dart';




void main() => runApp(MiApp());    
class MiApp extends StatelessWidget {   

  const MiApp({Key? key}) : super(key: key); 

  Widget build(BuildContext context) {
    return MaterialApp(
      title: "mi app",
      home: Inicio(),  
  };
}

