import 'package:flutter/material.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:red_cell/views/main_layout/tabs/chat/chat.dart';
import 'package:red_cell/views/main_layout/tabs/home/home.dart';
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
    ChatTab(),
    ProfileTab(),
  ];
  int selectTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[selectTab],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(43)),
        backgroundColor: ColorsManeger.red,
        onPressed: () {},
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
