import 'package:flutter/material.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final void Function(int?)? onTap;
  final int selectTab;

  const CustomBottomNavigationBar({
    super.key,
    this.onTap,
    required this.selectTab,
  });

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<String> itemIcons = [
    AssetsManeger.homeIcon,
    AssetsManeger.newsIcon,
    "space",
    AssetsManeger.chatIcon,
    AssetsManeger.profileIcon,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BottomAppBar(
        color: ColorsManeger.redWithOpacity5,
        elevation: 0,
        height: 55,
        shape: CircularNotchedRectangle(),
        notchMargin: 8,
        child: Container(
          child: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            enableFeedback: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            currentIndex: widget.selectTab,
            onTap: widget.onTap,
            items:
                itemIcons.map((e) {
                  if (e == "space") {
                    return BottomNavigationBarItem(
                      icon: SizedBox(width: 24),
                      label: "",
                    );
                  }
                  return items(e, itemIcons.indexOf(e) == widget.selectTab);
                }).toList(),
          ),
        ),
      ),
    );
  }

  BottomNavigationBarItem items(String imagePath, bool isActive) {
    return BottomNavigationBarItem(
      icon: Image(
        alignment: Alignment.center,
        width: 22,
        height: 22,
        image: AssetImage(imagePath),
        color: isActive ? ColorsManeger.red : ColorsManeger.black,
      ),
      label: "",
    );
  }
}
