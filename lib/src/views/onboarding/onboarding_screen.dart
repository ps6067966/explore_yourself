import 'package:shared_preferences/shared_preferences.dart';

import '../../interface/onboarding.dart';
import 'package:flutter/material.dart';
import '../../responsive/size_config.dart';
import 'custom_txt_btn.dart';
import 'onboard_nav_btn.dart';
import 'onboard_title_img_screen_part.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPageIndex = 0;

  final PageController _pageController = PageController(
    initialPage: 0,
  );

  Future setSeenOnboard() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isSeenOnboard', true);
  }

  AnimatedContainer dotIndicator(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      width: 10,
      height: 10,
      //  margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: currentPageIndex == index ? Colors.green : Colors.blue,
        shape: BoxShape.circle,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setSeenOnboard();
  }

  @override
  Widget build(BuildContext context) {
    // Initialize size configure
    SizeConfig().init(context);
    double sizeV = SizeConfig.blockSizeV!;

    // Onboarding Screen Starts from here
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          OnBoardTitleAndImageScreenPart(pageController: _pageController, currentPageIndex: currentPageIndex),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                currentPageIndex == onBoardingContents.length - 1
                    ? SizedBox(
                        height: sizeV * 5,
                        child: CustomTextButtonForOnboarding(
                          btnName: 'Getting Started',
                          onPressedCallback: () {
                            Navigator.restorablePushNamed(context, '/signup');
                          },
                          bgColor: Colors.green,
                        ),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          OnBoardNavBtn(
                              name: 'Skip',
                              onPressedCallback: () {
                                Navigator.restorablePushNamed(
                                    context, '/signup');
                              }),
                          Row(
                            children: List.generate(onBoardingContents.length,
                                (index) => dotIndicator(index)),
                          ),
                          OnBoardNavBtn(
                              name: 'Next',
                              onPressedCallback: () {
                                _pageController.nextPage(
                                    duration: const Duration(
                                      milliseconds: 400,
                                    ),
                                    curve: Curves.easeInOut);
                              }),
                        ],
                      ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
