import 'package:chat_flutter/config/constants.dart';
import 'package:chat_flutter/pages/views/calls_view.dart';
import 'package:chat_flutter/pages/views/chats_view.dart';
import 'package:chat_flutter/pages/views/groups_view.dart';
import 'package:chat_flutter/pages/views/settings_view.dart';
import 'package:flutter/material.dart';

import '../reusabel/custom_app_bar.dart';

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
      ChatView(),
      CallsView(),
      GroupView(),
      SettingsView(),
    ];
    return Scaffold(
      appBar: CustomAppBar(
        titleCustom: "Chats",
        actionsCustom: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.group_add_rounded,
            ),
          ),
        ],
      ),
      body: Container(
        color: COR_SECUNDARIA,
        child: telas[_indice],
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: COR_PRIMARIA,
          type: BottomNavigationBarType.fixed,
          currentIndex: _indice,
          onTap: (index) {
            setState(() {
              _indice = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.chat_outlined), label: "Chats"),
            BottomNavigationBarItem(icon: Icon(Icons.call), label: "Calls"),
            BottomNavigationBarItem(
                icon: Icon(Icons.group_outlined), label: "Groups"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}
