import 'package:flutter/material.dart';
import '../config/constants.dart';

class CustomAppBar extends AppBar {
  final String titleCustom;
  List<Widget>? actionsCustom;
  Widget? leadingCustom;

  CustomAppBar(
      {required this.titleCustom,
      this.actionsCustom,
      this.leadingCustom,
      Key? key})
      : super(key: key);

  @override
  Color? get backgroundColor => COR_SECUNDARIA;

  @override
  Widget? get title => Text(titleCustom,
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: DARK_GREY,
      ));

  @override
  IconThemeData? get iconTheme => const IconThemeData(color: COR_PRIMARIA);

  @override
  List<Widget>? get actions => actionsCustom;

  @override
  Widget? get leading => leadingCustom;

  @override
  double? get elevation => 0;
}
