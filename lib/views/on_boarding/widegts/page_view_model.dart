import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

PageViewModel customPageViewModel(
  BuildContext context, {
  required String image,
  required String title,
  required String subTitle,
}) {
  return PageViewModel(
    decoration: PageDecoration(footerFlex: 0),
    titleWidget: SizedBox(
      height: MediaQuery.of(context).size.height * 0.6,
      width: double.infinity,
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage(image),
      ),
    ),
    bodyWidget: Text(
      title,
      style: Theme
          .of(context)
          .textTheme
          .titleLarge,
    ),
    footer: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        textAlign: TextAlign.center,
        subTitle,
        style:Theme.of(context).textTheme.titleSmall,
      ),
    ),
  );
}
