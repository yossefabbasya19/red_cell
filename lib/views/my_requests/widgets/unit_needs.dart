import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class UnitNeeds extends StatelessWidget {
  final DonationDetailsDm donationDetailsDm;
  const UnitNeeds({super.key, required this.donationDetailsDm});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Text(
          "needs ${donationDetailsDm.totalUnits} units",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: ColorsManeger.gray,
          ),
        ),
        Spacer(),
        Text(
          overflow: TextOverflow.clip,
          "until ${donationDetailsDm.validTime}",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(width: 8),
      ],
    );
  }
}
