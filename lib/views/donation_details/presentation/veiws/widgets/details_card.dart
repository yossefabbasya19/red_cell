import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/extension/string_ex.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailsCard extends StatelessWidget {
  final DonationDetailsDm donationDetailsDm;
  final void Function()? onPressed;

  const DetailsCard({
    super.key,
    required this.donationDetailsDm,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: ColorsManeger.borderColor, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  fit: BoxFit.fill,
                  width: MediaQuery.sizeOf(context).width * 0.13,
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  image: AssetImage(donationDetailsDm.requestType.selectImage(context)),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Request ${donationDetailsDm.requestType}",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      donationDetailsDm.progressState.selectState(context),
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsManeger.gray,
                      ),
                    ),
                  ],
                ),
                Spacer(),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.pateint,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 8),
                Spacer(),
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
            ),
            SizedBox(height: 8),
            Row(
              children: [
                SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.valid_time,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  "until ${donationDetailsDm.validTime} ",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                ),
                SizedBox(width: 8),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 8),
                Text(
                  AppLocalizations.of(context)!.phone_number,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                  ),
                  onPressed: onPressed,
                  child: Text(
                    donationDetailsDm.phoneNumber,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
