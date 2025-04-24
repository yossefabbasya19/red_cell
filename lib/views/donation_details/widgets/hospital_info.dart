import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';

class HospitalInfo extends StatelessWidget {
  final DonationDetailsDm donationDetailsDm;

  const HospitalInfo({super.key, required this.donationDetailsDm});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context,MyRoutes.mapLocation,arguments: donationDetailsDm);
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  donationDetailsDm.hospitalName,
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorsManeger.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Icon(Icons.arrow_forward_ios,color: ColorsManeger.blue,)
            ],
          ),
        ),
      ),
    );
  }
}
