import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/extension/string_ex.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/helper/delete_post_from_my_donation.dart';
import 'package:red_cell/views/authentication/login/cubit/log_in/log_in_cubit.dart';

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
    userId = BlocProvider.of<LogInCubit>(context).userInfoDm.docId;
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
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      fit: BoxFit.fill,
                      width: MediaQuery.sizeOf(context).width * 0.13,
                      height: MediaQuery.sizeOf(context).height * 0.06,
                      image: AssetImage(
                        widget.donationDetailsDm.requestType.selectImage,
                      ),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Request ${widget.donationDetailsDm.requestType}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          widget.donationDetailsDm.progressState.selectState,
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
                        if (widget.isMyDonation ?? false) {
                          deletePostFromMyDonations(
                            context,
                            widget.donationDetailsDm,
                            userId!,
                          );
                        } else {
                          Navigator.pushNamed(
                            context,
                            MyRoutes.donationDetails,
                            arguments: widget.donationDetailsDm,
                          );
                        }
                      },
                      child: Text('Donate'),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(width: 8),
                    Text(
                      "pateint",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        widget.donationDetailsDm.pateintName,
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
                      "needs ${widget.donationDetailsDm.totalUnits} units( Remining ${widget.donationDetailsDm.totalUnits})  ",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: ColorsManeger.gray,
                      ),
                    ),
                    Spacer(),
                    Text(
                      overflow: TextOverflow.clip,
                      "until ${widget.donationDetailsDm.validTime}",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(width: 8),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    SizedBox(width: 8),
                    Icon(
                      Icons.location_on_outlined,
                      color: ColorsManeger.redWithOpacity5,
                    ),
                    Expanded(
                      child: Text(
                        widget.donationDetailsDm.hospitalCityAddress +
                            " - " +
                            widget.donationDetailsDm.hospitalGovernorateAddress,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: ColorsManeger.gray,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
  }
}
