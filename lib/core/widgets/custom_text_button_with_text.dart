import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';

class CustomTextButtonWithText extends StatelessWidget {
  const CustomTextButtonWithText({
    super.key,
    required this.descriptionText,
    required this.buttonText,
    this.onPressed,
  });

  final String descriptionText;
  final String buttonText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(descriptionText, style: Theme.of(context).textTheme.titleSmall),
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: GoogleFonts.poppins(
              color: ColorsManeger.black,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
