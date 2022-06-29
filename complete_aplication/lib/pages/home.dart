import 'package:complete_aplication/pages/views/home_view.dart';
import 'package:complete_aplication/pages/views/profile_view.dart';
import 'package:complete_aplication/pages/views/search_view.dart';
import 'package:complete_aplication/pages/views/shop_cart_view.dart';
import 'package:complete_aplication/routes/app_routes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      HomeView(),
      SearchView(),
      ShopCartView(),
      ProfileView(),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.grey),
        actions: <Widget>[
          TextButton(
            onPressed: () async {
              SharedPreferences sh = await SharedPreferences.getInstance();
              WidgetsFlutterBinding.ensureInitialized();
              await Firebase.initializeApp();
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut();
              sh.clear();
              Navigator.pushReplacementNamed(context, AppRoutes.WELCOME);
            },
            child: Text('Sair'),
          ),
        ],
      ),
      body: SafeArea(
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
            label: 'Busca',
            icon: Icon(Icons.search_outlined),
          ),
          BottomNavigationBarItem(
            label: 'Pedidos',
            icon: Icon(Icons.shopping_bag),
          ),
          BottomNavigationBarItem(
            label: 'Perfil',
            icon: Icon(Icons.account_circle),
          ),
        ],
      ),
    );
  }
}
