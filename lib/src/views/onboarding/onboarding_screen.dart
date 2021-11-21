import '../../interface/onboarding.dart';
import 'package:flutter/material.dart';
import '../../responsive/size_config.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    // Initialize size configure
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;

    // Onboarding Screen Starts from here
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: PageView.builder(
                itemCount: onBoardingContents.length,
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      Text(
                        onBoardingContents[index].title,
                        style: TextStyle(
                            fontSize: sizeH * 5,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      SizedBox(
                        height: sizeV * 50,
                        child: Image.asset(
                          onBoardingContents[index].image,
                          fit: BoxFit.contain,
                        ),
                      ),
                      SizedBox(
                        height: sizeV * 5,
                      ),
                      RichText(
                          text: const TextSpan(children: [
                        TextSpan(text: 'WE CAN'),
                        TextSpan(text: 'HELP YOU')
                      ]))
                    ],
                  );
                }),
          )
        ],
      )),
    );
  }
}
