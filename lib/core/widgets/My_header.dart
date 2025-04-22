import 'package:flutter/material.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class MyHeader extends StatelessWidget {
  final String title;
  const MyHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image(
          fit: BoxFit.contain,
          image: AssetImage(AssetsManeger.headerImage),
        ),
        Positioned(
          top:MediaQuery.sizeOf(context).height*0.07,
          left: MediaQuery.sizeOf(context).width*0.04,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 40,
                color: ColorsManeger.white,
                fontFamily: "Harlow"
            ),
          ),
        ),
      ],
    );
  }
}
