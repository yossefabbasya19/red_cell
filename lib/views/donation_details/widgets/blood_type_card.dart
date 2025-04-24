import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class BloodTypeCard extends StatelessWidget {
  const BloodTypeCard({super.key, required this.bloodType, required this.isActive});
  final String bloodType;
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return  isActive?Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManeger.white,
        boxShadow: [
          BoxShadow(
            color: ColorsManeger.gray.withValues(alpha: 0.2),
            offset: Offset(-2, 2),
            blurRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorsManeger.borderColor,
          width: 2,
        ),
      ),
      child: Text(
        textAlign: TextAlign.center ,
        bloodType,
        style: GoogleFonts.poppins(
          color: ColorsManeger.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    ):Container(
      margin: EdgeInsets.all(12),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: ColorsManeger.gray.withValues(alpha: 0.2),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: ColorsManeger.borderColor,
          width: 2,
        ),
      ),
      child: Text(
        textAlign: TextAlign.center ,
        bloodType,
        style: GoogleFonts.poppins(
          color: ColorsManeger.red,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
    );
  }
}
