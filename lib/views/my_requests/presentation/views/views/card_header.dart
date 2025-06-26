import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/DM/donation_details_Dm.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/extension/string_ex.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/views/my_requests/presentation/view_model/my_request_cubit.dart';

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
          image: AssetImage(donationDetailsDm.requestType.selectImage(context)),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${AppLocalizations.of(context)!.request} ${donationDetailsDm.requestType}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
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
        BlocConsumer<MyRequestCubit, MyRequestState>(
          listener: (context, state) {
            if (state is MyRequestSuccess) {
              showSnackBar(context, "your Post State is Updated");
            }
            if (state is MyRequestFailure) {
              showSnackBar(context, state.errorMessage);
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(ColorsManeger.red),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              onPressed: () {
                BlocProvider.of<MyRequestCubit>(
                  context,
                ).updateRequestState(donationDetailsDm);
              },
              child: Text(AppLocalizations.of(context)!.complete),
            );
          },
        ),
      ],
    );
  }
}
