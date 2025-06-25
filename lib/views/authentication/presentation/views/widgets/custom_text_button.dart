import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        style: TextButton.styleFrom(
        ),
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.forgetPassword);
        },
        child: Text(
          AppLocalizations.of(context)!.forget_password,
          style: TextStyle(
            color: ColorsManeger.red,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
