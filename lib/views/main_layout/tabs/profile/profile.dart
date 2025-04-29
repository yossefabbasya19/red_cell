import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/provider/config_provider/config_provider.dart';
import 'package:red_cell/views/authentication/widgets/custom_status.dart';
import 'package:red_cell/views/main_layout/tabs/profile/widgets/text_button_with_icon.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  bool switchButton = false;

  @override
  Widget build(BuildContext context) {
    ConfigProvider config = Provider.of<ConfigProvider>(context);
    return SafeArea(
      child: FutureBuilder(
        future: Provider.of<ConfigProvider>(context).getValue(),
        builder: (context,snapShot) {
          if(snapShot.hasData){
            return Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomStatus(
                    titleOne: AppLocalizations.of(context)!.profile,
                    titleTwo: "",
                  ),
                  SizedBox(height: MediaQuery.sizeOf(context).height * 0.076),
                  TextButtonWithIcon(
                    label: AppLocalizations.of(context)!.account_management,
                    icon: Icons.person_outline,
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.editProfile);
                    },
                  ),
                  Row(
                    children: [
                      TextButtonWithIcon(
                        label: AppLocalizations.of(context)!.language,
                        icon: Icons.language,
                      ),
                      Spacer(),
                      Switch(
                        activeColor: ColorsManeger.red,
                        value: snapShot.data!,
                        onChanged: (value) {
                          config.configSetting(value);
                          switchButton = value;
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  TextButtonWithIcon(
                    onPressed: () {
                      Navigator.pushNamed(context, MyRoutes.myRequests);
                    },
                    label: AppLocalizations.of(context)!.my_requests,
                    icon: Icons.my_library_books,
                  ),
                  SizedBox(height: 8),
                  TextButtonWithIcon(
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                      Navigator.pushReplacementNamed(context, MyRoutes.login);
                    },
                    label: AppLocalizations.of(context)!.login_out,
                    icon: Icons.logout,
                  ),
                ],
              ),
            );
          }else{
            return CircularProgressIndicator();
          }
        }
      ),
    );
  }
}
