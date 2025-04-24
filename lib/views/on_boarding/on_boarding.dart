import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:red_cell/core/DM/on_boarding_DM.dart';
import 'package:red_cell/core/assets_maneger/assets_maneger.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/my_routes/my_routes.dart';
import 'package:red_cell/core/share_pref/share_preference.dart';
import 'package:red_cell/views/on_boarding/widegts/page_view_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  @override
  void dispose() {
    SharePreference.setOnBoardingStates(true);
    super.dispose();
  }
  List<OnBoardingDm> itemsData = [
    OnBoardingDm(
      image: AssetsManeger.onBoarding1,
      title: "Track the donor",
      subTitle:
          "Please read our privacy policy and policy regarding before registering.",
    ),
    OnBoardingDm(
      image: AssetsManeger.onBoarding2,
      title: "find the right Donor ",
      subTitle: "you can find donors per Location and Blood Group.",
    ),
    OnBoardingDm(
      image: AssetsManeger.onBoarding3,
      title: "Be a hero and save a life",
      subTitle:
          "you can make a donation and share a case of a patient who need blood.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        controlsMargin: EdgeInsets.symmetric(horizontal: 16),
        nextFlex: 0,
        skipOrBackFlex: 0,
        doneStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ColorsManeger.red),
        ),
        nextStyle: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(ColorsManeger.red),
        ),
        dotsDecorator: DotsDecorator(
          color: ColorsManeger.gray,
          activeSize: Size(20, 8),
          size: Size(8, 8),
          activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          activeColor: ColorsManeger.red,
        ),
        controlsPadding: EdgeInsets.symmetric(vertical: 16),
        onDone: () {
          Navigator.pushReplacementNamed(context, MyRoutes.login);
        },
        onSkip: () {
          Navigator.pushReplacementNamed(context, MyRoutes.login);
        },
        done: Text(
          "done",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        next: Text(
          "next",
          style: Theme.of(context).textTheme.labelMedium,
        ),
        skip: Text(
          "skip",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        showSkipButton: true,
        pages:
            itemsData.map((e) {
              return customPageViewModel(
                context,
                image: e.image,
                title: e.title,
                subTitle: e.subTitle,
              );
            }).toList(),
      ),
    );
  }
}
