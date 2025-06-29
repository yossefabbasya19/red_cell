import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/helper/show_snack_bar.dart';
import 'package:red_cell/core/helper/text_form_field_validation_function.dart';
import 'package:red_cell/core/remote_storage/get_specific_user.dart';
import 'package:red_cell/core/widgets/custom_eleveted_button.dart';
import 'package:red_cell/views/account_managment/presentation/view_model/edit_profile_cubit.dart';
import 'package:red_cell/views/account_managment/presentation/views/widgets/image_picker.dart';
import 'package:red_cell/views/account_managment/presentation/views/widgets/user_edit_field.dart';
import 'package:red_cell/views/authentication/presentation/views/widgets/custom_status.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserInfoDm? infoAfterEdit = UserInfoDm();
  GlobalKey<FormState> formKey = GlobalKey();
  bool isChange = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getSpecificUser(FirebaseAuth.instance.currentUser!.uid),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            UserInfoDm userInfoDm = snapShot.data!;
            return ListView.builder(
              itemCount: 1,
              itemBuilder:
                  (context, index) => SafeArea(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            CustomStatus(
                              titleOne:
                                  AppLocalizations.of(context)!.edit_profile,
                              titleTwo: "",
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.076,
                            ),
                            ImagePickerAndUpdate(
                              imagePath: snapShot.data!.imagePath ?? '',
                            ),
                            SizedBox(
                              height: MediaQuery.sizeOf(context).height * 0.03,
                            ),
                            UserEditField(
                              onSave: (value) {
                                userInfoDm.userName = value!;
                              },
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "required";
                                }
                                return null;
                              },
                              userInfoDm: userInfoDm,
                              fieldName:
                                  AppLocalizations.of(context)!.user_name,
                              initialValue: userInfoDm.userName ?? "user name",
                            ),
                            UserEditField(
                              validator: emailValidation,
                              onSave: (value) {
                                userInfoDm.emailAddress = value!;
                              },
                              userInfoDm: userInfoDm,
                              fieldName:
                                  AppLocalizations.of(context)!.email_address,
                              initialValue:
                                  userInfoDm.emailAddress ?? "email address",
                            ),
                            UserEditField(
                              onSave: (value) {
                                userInfoDm.phoneNumber = value!;
                              },
                              validator: phoneValidation,
                              userInfoDm: userInfoDm,
                              fieldName:
                                  AppLocalizations.of(context)!.phone_number,
                              initialValue:
                                  userInfoDm.phoneNumber ?? "phone Number",
                            ),
                            BlocConsumer<EditProfileCubit, EditProfileState>(
                              listener: (context, state) {
                                if (state is EditProfileSuccess) {
                                  Navigator.pop(context);
                                } else if (state is EditProfileFailure) {
                                  showSnackBar(context, state.errorMessage);
                                }
                              },
                              builder: (context, state) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                    top:
                                        MediaQuery.sizeOf(context).height *
                                        0.05,
                                  ),
                                  child: CustomElevatedButton(
                                    onPressed: () async {
                                      formKey.currentState!.save();
                                      userInfoDm.imagePath =
                                          BlocProvider.of<EditProfileCubit>(
                                            context,
                                          ).imagePath;
                                      BlocProvider.of<EditProfileCubit>(
                                        context,
                                      ).editProfile(userInfoDm);
                                    },
                                    widget:
                                        state is EditProfileLoading
                                            ? CircularProgressIndicator()
                                            : Text(
                                              AppLocalizations.of(
                                                context,
                                              )!.done,
                                              style:
                                                  Theme.of(
                                                    context,
                                                  ).textTheme.labelMedium,
                                            ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
            );
          } else if (snapShot.hasError) {
            return SafeArea(child: Text(snapShot.error.toString()));
          } else {
            return Center(
              child: CircularProgressIndicator(color: ColorsManeger.red),
            );
          }
        },
      ),
    );
  }
}
