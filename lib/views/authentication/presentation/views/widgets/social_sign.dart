import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/views/authentication/social_auth/social_auth.dart';

class SocialSign extends StatelessWidget {
  final void Function()? googleSocialSign;
  final void Function()? facebookSocialSign;

  const SocialSign({super.key, this.googleSocialSign, this.facebookSocialSign});


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
              onTap: () async {
                await signInWithGoogle(context);
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 21),
                alignment: Alignment.center,
                child: Text(
                  "sign in with Google",
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: ColorsManeger.red,
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
