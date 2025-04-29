import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/extension/string_ex.dart';
import 'package:red_cell/core/helper/delete_post_from_my_donation.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CardHeader extends StatelessWidget {
  final DonationDetailsDm donationDetailsDm;
  final String? userId;
 final bool? isMyDonation;
  const CardHeader({super.key, required this.donationDetailsDm, this.userId, required this.isMyDonation});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
          fit: BoxFit.fill,
          width: MediaQuery.sizeOf(context).width * 0.13,
          height: MediaQuery.sizeOf(context).height * 0.06,
          image: AssetImage(
            donationDetailsDm.requestType.selectImage(context),
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${AppLocalizations.of(context)!.request} ${donationDetailsDm.requestType}",
              style: TextStyle(
                fontSize: 20,
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
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(
              ColorsManeger.red,
            ),
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          onPressed: () async {
            if (isMyDonation ?? false) {
              deletePostFromMyDonations(
                context,
               donationDetailsDm,
                userId!,
              );
            } else {
              Navigator.pushNamed(
                context,
                MyRoutes.donationDetails,
                arguments:donationDetailsDm,
              );
            }
          },
          child: Text(AppLocalizations.of(context)!.donate),
        ),
      ],
    );
  }
}
