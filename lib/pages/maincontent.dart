import 'package:flutter/material.dart';

void main() => runApp(const PaginaHome());

class PaginaHome extends StatelessWidget {
  const PaginaHome({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Para Ti',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  'Siguiendo',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
        
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        
        onPressed: () {
          print('FloatingActionButton pressed!');
        },
        child: const Icon(Icons.add),
        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }
}
