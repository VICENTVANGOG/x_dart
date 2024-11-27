import 'package:flutter/material.dart';
import 'package:x/pages/grok.dart';
import 'package:x/pages/maincontent.dart';
import 'package:x/pages/search.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _paginaActual = 0;

  final List<Widget> _paginas = [const HomePage(), const paginasearch(), const Grok()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
           backgroundColor: Colors.black,
          body: _paginas[_paginaActual],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: const Color.fromRGBO(33, 150, 243, 1),
            unselectedItemColor: Colors.white,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (index) {
              setState(() {
                _paginaActual = index;
              });
            },
            currentIndex: _paginaActual,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Buscar',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notificaciones',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.mail),
                label: 'Mensajes',
              ),
            ],
          ),
        ));
  }
}
