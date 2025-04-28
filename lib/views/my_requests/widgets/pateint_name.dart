import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class PateintName extends StatelessWidget {
  final DonationDetailsDm donationDetailsDm;
  const PateintName({super.key, required this.donationDetailsDm});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Text(
          "pateint",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 8),
        Expanded(
          child: Text(
            donationDetailsDm.pateintName,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: ColorsManeger.gray,
            ),
          ),
        ),
      ],
    );
  }
}
