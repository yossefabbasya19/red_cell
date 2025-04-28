import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class TextButtonWithIcon extends StatelessWidget {
  const TextButtonWithIcon({super.key, this.onPressed, required this.label, required this.icon});
  final void Function()? onPressed;
  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: TextButton.styleFrom(
          overlayColor: ColorsManeger.redWithOpacity5
      ),
      onPressed: onPressed,
      label: Text(
        label,
        style: TextStyle(color: ColorsManeger.black),
      ),
      icon: Icon(
        icon,
        color: ColorsManeger.black,
      ),
    );
  }
}
