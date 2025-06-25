import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:red_cell/views/main_layout/tabs/home/home.dart';
import 'package:red_cell/views/main_layout/tabs/my_donations/my_donations%20.dart';
import 'package:red_cell/views/main_layout/tabs/news/news.dart';
import 'package:red_cell/views/main_layout/tabs/profile/profile.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  List<Widget> tabs = [
    HomeTab(),
    NewsTab(),
    SizedBox(),
    MyDonations(),
    ProfileTab(),
  ];
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          tabs[selectTab],
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManeger.gray,
                padding: EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context,MyRoutes.chat);
              },
              child: Text(
                "Chat With AI",
                style: Theme.of(context).textTheme.labelMedium,
              ),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(43)),
        backgroundColor: ColorsManeger.red,
        onPressed: () {
          Navigator.pushNamed(context, MyRoutes.requestDetails);
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectTab: selectTab,
        onTap: (value) {
          selectTab = value!;
          setState(() {});
        },
      ),
    );
  }
}
