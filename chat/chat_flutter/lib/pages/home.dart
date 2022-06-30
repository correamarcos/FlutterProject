import 'package:chat_flutter/config/constants.dart';
import 'package:flutter/material.dart';

import '../reusabel/custom_app_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
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
      ),
    );
  }
}
