import 'package:flutter/material.dart';

void main() => runApp(const  paginahome());

class paginahome extends StatelessWidget {
  const paginahome({super.key});

  @override
  Widget build(BuildContext context) {
     return Container(
      
      child: Column( 

        children: [
          Text(
              'Para Ti',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text(
              'Siguiendo',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),


          Expanded(
            child: Container(
              color: Colors.red,
           
            ),
          ),
          Text('Texto en la parte inferior' ,
         style: TextStyle(fontSize: 20, color: Colors.white),),
        ],
      ),
    );
  }
}





