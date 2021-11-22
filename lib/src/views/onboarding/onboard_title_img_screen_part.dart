import 'dart:developer';

import 'package:explore_yourself/src/interface/onboarding.dart';
import 'package:explore_yourself/src/responsive/size_config.dart';
import 'package:flutter/material.dart';

class OnBoardTitleAndImageScreenPart extends StatefulWidget {
  const OnBoardTitleAndImageScreenPart({
    Key? key,
    required this.pageController,
    required this.currentPageIndex,
  }) : super(key: key);
  final PageController pageController;
  final int currentPageIndex;

  @override
  State<OnBoardTitleAndImageScreenPart> createState() =>
      _OnBoardTitleAndImageScreenPartState();
}

class _OnBoardTitleAndImageScreenPartState
    extends State<OnBoardTitleAndImageScreenPart> {
  final double sizeH = SizeConfig.blockSizeH!;
  final double sizeV = SizeConfig.blockSizeV!;
  

  // SizedBox used three times with same height.
  sizedBox() => SizedBox(
        height: sizeV * 5,
      );
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = widget.currentPageIndex;
    return Expanded(
      flex: 9,
      child: PageView.builder(
          controller: widget.pageController,
          onPageChanged: (value) {
            setState(() {
              currentPageIndex = value;
              log("$currentPageIndex");
            });
          },
          itemCount: onBoardingContents.length,
          itemBuilder: (ctx, index) {
            return Column(
              children: [
                sizedBox(),
                Text(
                  onBoardingContents[index].title,
                  style: TextStyle(
                      fontSize: sizeH * 5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                sizedBox(),
                SizedBox(
                  height: sizeV * 50,
                  child: Image.asset(
                    onBoardingContents[index].image,
                    fit: BoxFit.contain,
                  ),
                ),
                sizedBox(),
                const Text('Description')
              ],
            );
          }),
    );
  }
}
