import 'package:chat_flutter/config/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'CHATS',
        style: TextStyle(fontSize: 25, color: COR_PRIMARIA),
      ),
    );
  }
}
