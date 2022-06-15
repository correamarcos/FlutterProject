import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/material/bottom_navigation_bar.dart';
import 'package:youtube/pages/views/alta.dart';
import 'package:youtube/pages/views/biblioteca.dart';
import 'package:youtube/pages/views/inicio.dart';
import 'package:youtube/pages/views/inscricoes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indice = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricoes(),
      Biblioteca(),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.grey),
        title: Image.asset(
          "assets/images/youtube.png",
          width: 98,
          height: 22,
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              print("Ação videocam");
            },
            icon: Icon(Icons.videocam),
          ),
          IconButton(
            onPressed: () {
              print("Ação search");
            },
            icon: Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {
              print("Ação account");
            },
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
      body: Center(
        child: telas[_indice],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        type: BottomNavigationBarType.fixed,
        currentIndex: _indice,
        onTap: (index) {
          setState(() {
            _indice = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: 'Inicio',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Em alta',
            icon: Icon(Icons.whatshot),
          ),
          BottomNavigationBarItem(
            label: 'Inscricões',
            icon: Icon(Icons.subscriptions),
          ),
          BottomNavigationBarItem(
            label: 'Biblioteca',
            icon: Icon(Icons.folder),
          ),
        ],
      ),
    );
  }
}
