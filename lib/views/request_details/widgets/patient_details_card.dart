import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:red_cell/core/constant.dart';
import 'package:red_cell/core/helper/text_form_field_validation_function.dart';
import 'package:red_cell/core/widgets/custom_drob_down_button.dart';
import 'package:red_cell/views/request_details/cubit/add_donation_cubit.dart';
import 'package:red_cell/views/request_details/widgets/request_details_Text_field.dart';
import 'package:red_cell/views/request_details/widgets/request_details_date_picker.dart';
import 'package:red_cell/views/request_details/widgets/request_details_drop_down.dart';

class PatientInfoCard extends StatefulWidget {
  const PatientInfoCard({super.key});

  @override
  State<PatientInfoCard> createState() => _PatientInfoCardState();
}

class _PatientInfoCardState extends State<PatientInfoCard> {
  String selectType = "A+";
  String selectDate = "select date";

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropDownButton(
              label: "Request Type",
              Items: ["blood", 'Plasma', 'platelets'],
              onSelect: (value) {
                BlocProvider.of<AddDonationCubit>(context).requestType = value!;
              },
            ),
            SizedBox(height: 8),
            Divider(thickness: 2),
            RequestDetailsTextField(
              label: "Patient Name",
              keyboardType: TextInputType.name,
              validation: (value) {
                if (value!.isEmpty) {
                  return "required";
                }
                return null;
              },
              onSave: (value) {
                BlocProvider.of<AddDonationCubit>(context).pateintName = value!;
              },
            ),
            Row(
              children: [
                Expanded(
                  child: RequestDetailsDropDown(
                    label: "Required type",
                    items: bloodTypes,
                    selected: selectType,
                    onChange: (value) {
                      selectType = value as String;
                      BlocProvider.of<AddDonationCubit>(context).bloodType =
                          value;
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 23),
                Expanded(
                  child: RequestDetailsTextField(
                    validation: (value) {
                      if(value!.isNotEmpty){
                        if (int.tryParse(value)! > 20) {
                          return "maxmum 20 unit";
                        }
                      }else{
                        return "requered";
                      }
                      BlocProvider.of<AddDonationCubit>(
                        context,
                      ).totalUnits = int.parse(value);
                      return null;
                    },
                    label: "Number of unites",
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: RequestDetailsDatePicker(
                    selectDate: selectDate,
                    onSelectDate: (value) {
                      selectDate = DateFormat("Md").format(value!);
                      BlocProvider.of<AddDonationCubit>(
                        context,
                      ).validTime = DateFormat("Md").format(value);
                      setState(() {});
                    },
                  ),
                ),
                SizedBox(width: 23),
                Expanded(
                  child: RequestDetailsTextField(
                    onSave: (value) {
                      BlocProvider.of<AddDonationCubit>(context).phoneNumber =
                          value!;
                    },
                    validation: phoneValidation,
                    label: "phone Number",
                    keyboardType: TextInputType.number,
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
