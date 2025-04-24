import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/views/donation_details/widgets/blood_type_card.dart';

class BloodTypeGridview extends StatelessWidget {
  const BloodTypeGridview({super.key, required this.donationDetailsDm});

  final DonationDetailsDm donationDetailsDm;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: bloodTypes.length,
        itemBuilder: (context, index) {
          return BloodTypeCard(
            bloodType: bloodTypes[index],
            isActive: compatibilityBloodType[donationDetailsDm.bloodType]!
                .contains(bloodTypes[index]),
          );
        },
      ),
    );
  }
}
