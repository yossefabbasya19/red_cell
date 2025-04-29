import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/remote_storage/get_specific_user_field.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_cell/views/donation_details/widgets/blood_type_gridview.dart';
import 'package:red_cell/views/donation_details/widgets/details_card.dart';
import 'package:red_cell/views/donation_details/widgets/hospital_info.dart';
import 'package:red_cell/views/donation_details/widgets/remaining_unit_card.dart';
import 'package:url_launcher/url_launcher.dart';

class DonationDetails extends StatefulWidget {
  const DonationDetails({super.key});

  @override
  State<DonationDetails> createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  String? userId;

  late DonationDetailsDm donationDetailsDm;

  List<dynamic> userDonation = [];

  @override
  void initState() {
    userId =FirebaseAuth.instance.currentUser!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    donationDetailsDm =
        ModalRoute.of(context)!.settings.arguments as DonationDetailsDm;
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.donation_details)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              SizedBox(height: 8),
              RemainingUnitCard(donationDetailsDm: donationDetailsDm),
              SizedBox(height: 8),
              DetailsCard(
                donationDetailsDm: donationDetailsDm,
                onPressed:
                    () async => await launchUrl(
                      Uri.parse("tel:${donationDetailsDm.phoneNumber}"),
                    ),
              ),
              SizedBox(height: 8),
              BloodTypeGridview(donationDetailsDm: donationDetailsDm),
              SizedBox(height: 8),
              HospitalInfo(donationDetailsDm: donationDetailsDm),
              SizedBox(height: 8),
              CustomElevatedButton(
                onPressed: () async{
                  userDonation = await getSpecificUserField(userId!);
                  userDonation.add(donationDetailsDm.docID);
                  userDonation = userDonation.toSet().toList();
                  FirebaseFirestore.instance
                      .collection(fireStoreUsers)
                      .doc(userId)
                      .update({"myDonation": userDonation});
                  Navigator.pushNamed(context, MyRoutes.myDonation);
                },
                widget: Text(
                  AppLocalizations.of(context)!.donate,
                  style: TextStyle(
                    color: ColorsManeger.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
