import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class DisplayHospitalInfo extends StatelessWidget {
  final DonationDetailsDm donationDetailsDm;
  const DisplayHospitalInfo({super.key, required this.donationDetailsDm});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 8),
        Icon(
          Icons.location_on_outlined,
          color: ColorsManeger.redWithOpacity5,
        ),
        Expanded(
          child: Text(
            donationDetailsDm.hospitalCityAddress +
                " - " +
                donationDetailsDm.hospitalGovernorateAddress,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: ColorsManeger.gray,
            ),
          ),
        ),
      ],
    );
  }
}
