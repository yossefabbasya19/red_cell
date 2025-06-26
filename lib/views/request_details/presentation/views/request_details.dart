import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/views/request_details/presentation/view_model/add_donation_cubit.dart';
import 'package:red_cell/views/request_details/presentation/view_model/add_donation_state.dart';
import 'package:red_cell/views/request_details/presentation/views/widgets/hospital_info_card.dart';
import 'package:red_cell/views/request_details/presentation/views/widgets/patient_details_card.dart';

class RequestDetails extends StatefulWidget {
  const RequestDetails({super.key});

  @override
  State<RequestDetails> createState() => _RequestDetailsState();
}

class _RequestDetailsState extends State<RequestDetails> {

  GlobalKey<FormState> formKey = GlobalKey();
  double? lat;
  double? long;

  @override
  Widget build(BuildContext context) {return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)!.request_details,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                PatientInfoCard(),
                SizedBox(height: 16),
                HospitalInfoCard(),
                SizedBox(height: 16),
                BlocConsumer<AddDonationCubit, AddDonationState>(
                  listener: (context, state) {
                    if (state is AddDonationSuccess) {
                      Navigator.pop(context);
                    }
                    if (state is AddDonationFailure) {
                      showSnackBar(context,state.errMessage);
                    }
                  },
                  builder: (context, state) {
                    return CustomElevatedButton(
                      widget:
                          state is AddDonationLoading
                              ?Center(
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ):Text(
                            AppLocalizations.of(context)!.done,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            BlocProvider.of<AddDonationCubit>(
                              context,
                            ).addDonationRequest();
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
