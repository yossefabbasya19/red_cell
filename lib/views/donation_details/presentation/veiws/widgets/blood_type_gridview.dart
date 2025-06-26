import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/views/donation_details/presentation/veiws/widgets/blood_type_card.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BloodTypeGridview extends StatelessWidget {
  const BloodTypeGridview({super.key, required this.donationDetailsDm});

  final DonationDetailsDm donationDetailsDm;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16,left: 16),
            child: Text(
              AppLocalizations.of(context)!.blood_donor_type_required,
              style: TextStyle(
                color: ColorsManeger.blue,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          GridView.builder(
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
        ],
      ),
    );
  }
}
