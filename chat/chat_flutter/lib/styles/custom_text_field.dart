import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {Key? key,
      this.hint,
      this.prefix,
      this.suffix,
      this.obscure,
      this.textInputType,
      this.onChanged,
      this.enabled,
      this.controller,
      this.padding,
      this.label})
      : super(key: key);

  final TextEditingController? controller;
  final String? hint;
  final Widget? prefix;
  final Widget? suffix;
  final bool? obscure;
  final TextInputType? textInputType;
  final Function(String)? onChanged;
  final bool? enabled;
  final double? padding;
  final String? label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(32),
      ),
      padding: prefix != null ? null : const EdgeInsets.only(left: 16),
      child: TextField(
        controller: controller,
        obscureText: obscure!,
        keyboardType: textInputType,
        onChanged: onChanged,
        enabled: enabled,
        decoration: InputDecoration(
          hintText: hint,
          label: Text(label!),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
          prefixIcon: prefix,
          suffixIcon: suffix,
          contentPadding: EdgeInsets.only(left: padding!),
        ),
        textAlignVertical: TextAlignVertical.center,
      ),
    );
  }
}
