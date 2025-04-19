import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class SocialSign extends StatelessWidget {
  final void Function()? googleSocialSign;
  final void Function()? facebookSocialSign;

  const SocialSign({
    super.key,
     this.googleSocialSign,
     this.facebookSocialSign,
  });

  @override
  Widget build(BuildContext context) {
    return Container(

      decoration: BoxDecoration(
        border: Border.all(
          color: ColorsManeger.gray.withValues(alpha: 0.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: facebookSocialSign,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 21),
                alignment: Alignment.center,
                child: Text(
                  "FaceBook",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff3E6AB2),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: googleSocialSign,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 21),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(AssetsManeger.googleBG),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  "Google",
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff39A751),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
