import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/views/request_details/presentation/view_model/add_donation_cubit.dart';
import 'package:red_cell/views/request_details/presentation/views/widgets/request_details_Text_field.dart';
import 'package:red_cell/views/request_details/presentation/views/widgets/request_details_drop_down.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HospitalInfoCard extends StatefulWidget {
  const HospitalInfoCard({super.key});

  @override
  State<HospitalInfoCard> createState() => _HospitalInfoCardState();
}

class _HospitalInfoCardState extends State<HospitalInfoCard> {

  @override
  Widget build(BuildContext context) {
  String selectedGovernorates = getEgyptGovernorates(context)[0];
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text(
              AppLocalizations.of(context)!.hospital_Info,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            RequestDetailsTextField(
              onSave: (value) {
                BlocProvider.of<AddDonationCubit>(context).hospitalName =
                    value!;
              },
              validation: (value) {
                if (value!.isEmpty) {
                  return "required";
                }
                return null;
              },
              label: AppLocalizations.of(context)!.hospital_name,
              keyboardType: TextInputType.text,
            ),
            RequestDetailsTextField(
              validation: (value) {
                if (value!.isEmpty) {
                  return "required";
                }
                return null;
              },
              onSave: (value) {
                BlocProvider.of<AddDonationCubit>(context).hospitalCityAddress =
                    value!;
              },
              label: AppLocalizations.of(context)!.hospital_city_address,
              keyboardType: TextInputType.text,
            ),
            RequestDetailsDropDown(
              selected: selectedGovernorates,
              label: AppLocalizations.of(context)!.governorates,
              items: getEgyptGovernorates(context),
              onChange: (value) {
                selectedGovernorates = value as String;
                BlocProvider.of<AddDonationCubit>(context)
                    .hospitalGovernorateAddress = value;
                setState(() {});
              },
            ),
            SizedBox(height: 8),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  SizedBox(width: 16),
                  Text(
                    AppLocalizations.of(context)!.select_place,
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsManeger.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.requestLocation);
                    },
                    icon: Icon(
                      Icons.navigate_next,
                      color: ColorsManeger.blue,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
