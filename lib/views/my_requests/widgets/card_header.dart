import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/extension/string_ex.dart';
import 'package:red_cell/core/remote_storage/update_donation_state.dart';

class CardHeader extends StatelessWidget {
  final DonationDetailsDm donationDetailsDm;

  const CardHeader({super.key, required this.donationDetailsDm});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          fit: BoxFit.fill,
          width: MediaQuery.sizeOf(context).width * 0.13,
          height: MediaQuery.sizeOf(context).height * 0.06,
          image: AssetImage(donationDetailsDm.requestType.selectImage),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Request ${donationDetailsDm.requestType}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            Text(
              donationDetailsDm.progressState.selectState,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: ColorsManeger.gray,
              ),
            ),
          ],
        ),
        Spacer(),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(ColorsManeger.red),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
          ),
          onPressed: () {
            updateDonationState(donationDetailsDm.docID);
          },
          child: Text("Complete"),
        ),
      ],
    );
  }
}
