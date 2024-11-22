import 'package:flutter/material.dart';

void main() => runApp(const  Grok());

class Grok extends StatelessWidget {
  const Grok({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Grok',style: TextStyle(fontSize: 30),) ,
    );
  }
}
