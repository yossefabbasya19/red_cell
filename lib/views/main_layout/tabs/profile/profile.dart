import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/views/authentication/widgets/custom_status.dart';
import 'package:red_cell/views/main_layout/tabs/profile/widgets/text_button_with_icon.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomStatus(titleOne: "Profile", titleTwo: ""),
            SizedBox(height: MediaQuery.sizeOf(context).height * 0.076),
            TextButtonWithIcon(
              label: "Account management",
              icon: Icons.person_outline,
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.editProfile);
              },
            ),
            SizedBox(height: 8),
            TextButtonWithIcon(
              onPressed: () {
                Navigator.pushNamed(context, MyRoutes.myRequests);
              },
              label: "My Requests",
              icon: Icons.my_library_books,
            ),
            SizedBox(height: 8),
            TextButtonWithIcon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, MyRoutes.login);
              },
              label: "Login out",
              icon: Icons.logout,
            ),
          ],
        ),
      ),
    );
  }
}
