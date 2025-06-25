import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/views/main_layout/tabs/home/widgets/card_header.dart';
import 'package:red_cell/views/my_requests/widgets/hospital_info.dart';
import 'package:red_cell/views/my_requests/widgets/pateint_name.dart';
import 'package:red_cell/views/my_requests/widgets/unit_needs.dart';

class BloodRequestCard extends StatefulWidget {
  final bool isMyPost;
  final bool? isMyDonation;

  const BloodRequestCard({
    super.key,
    required this.donationDetailsDm,
    required this.isMyPost,
    this.isMyDonation,
  });

  final DonationDetailsDm donationDetailsDm;

  @override
  State<BloodRequestCard> createState() => _BloodRequestCardState();
}

class _BloodRequestCardState extends State<BloodRequestCard> {
  late String? userId;
  List<dynamic> userDonation = [];

  @override
  void initState() {
    userId = FirebaseAuth.instance.currentUser!.uid;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMyPost
        ? SizedBox()
        : Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(color: ColorsManeger.borderColor, width: 1),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8),
            child: Column(
              children: [
                CardHeader(donationDetailsDm: widget.donationDetailsDm, userId: userId,isMyDonation: widget.isMyDonation,),
                PateintName(donationDetailsDm: widget.donationDetailsDm),
                SizedBox(height: 8),
                UnitNeeds(donationDetailsDm: widget.donationDetailsDm),
                SizedBox(height: 8),
                DisplayHospitalInfo(
                  donationDetailsDm: widget.donationDetailsDm,
                ),
              ],
            ),
          ),
        );
  }
}
