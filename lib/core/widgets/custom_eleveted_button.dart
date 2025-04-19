import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class CustomElevatedButton extends StatelessWidget {
  final Widget widget;
  final void Function()? onPressed;
  const CustomElevatedButton({super.key, required this.widget,  this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
          backgroundColor: WidgetStatePropertyAll(ColorsManeger.red),
        ),
        onPressed: onPressed,
        child: widget,
      ),
    );
  }
}
