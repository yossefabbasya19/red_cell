import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/views/request_details/cubit/add_donation_cubit.dart';
import 'package:red_cell/views/request_details/widgets/request_details_Text_field.dart';
import 'package:red_cell/views/request_details/widgets/request_details_drop_down.dart';

class HospitalInfoCard extends StatefulWidget {
  const HospitalInfoCard({super.key});

  @override
  State<HospitalInfoCard> createState() => _HospitalInfoCardState();
}

class _HospitalInfoCardState extends State<HospitalInfoCard> {
  String selectedGovernorates = "el-bihera";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Text("Hospital Info", style: Theme.of(context).textTheme.bodyLarge),
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
              label: "hospital name",
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
              label: "hospital city address",
              keyboardType: TextInputType.text,
            ),
            RequestDetailsDropDown(
              selected: selectedGovernorates,
              label: "governorates",
              items: egyptGovernorates,
              onChange: (value) {
                selectedGovernorates = value as String;
                BlocProvider.of<AddDonationCubit>(context)
                    .hospitalGovernorateAddress = value;
                setState(() {});
              },
            ),
            SizedBox(height: 8,),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: Row(
                children: [
                  SizedBox(width: 16,),
                  Text(
                    "select place",
                    style: TextStyle(
                      fontSize: 20,
                      color: ColorsManeger.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: () {
                    Navigator.pushNamed(context, MyRoutes.requestLocation);
                  }, icon: Icon(Icons.navigate_next,color: ColorsManeger.blue,size: 30,))
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
