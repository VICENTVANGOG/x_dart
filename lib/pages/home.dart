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

  List<Widget> _paginas = [PaginaHome(), paginasearch(), Grok()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: Scaffold(
           backgroundColor: Colors.black,
          appBar: AppBar(
            backgroundColor: Colors.black,
            title: Row(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://lh3.googleusercontent.com/a/ACg8ocKILT0CSA30Au7_0zj3wlsxD3oKQ-3nnwur8l0-M8Fgu8qJuw=s288-c-no"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 50,
                  height: 50,
                  margin: EdgeInsets.all(8.0),
                ),
                Image.network(
                  "https://pbs.twimg.com/media/F1zrsq8XsAUU7Lw?format=jpg&name=large",
                  width: 150,
                  height: 50,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.settings, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
              ),
            ],
          ),
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
