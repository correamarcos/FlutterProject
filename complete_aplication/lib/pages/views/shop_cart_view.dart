import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ShopCartView extends StatefulWidget {
  const ShopCartView({Key? key}) : super(key: key);

  @override
  State<ShopCartView> createState() => _ShopCartViewState();
}

class _ShopCartViewState extends State<ShopCartView> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pedidos',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
    );
  }
}
