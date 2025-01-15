import 'package:fiscal_focus_app/data/onboarding_data.dart';
import 'package:fiscal_focus_app/screens/onboarding/first_page.dart';
import 'package:fiscal_focus_app/screens/onboarding/shared_onboarding_screen.dart';
import 'package:fiscal_focus_app/screens/user_data_screen.dart';
import 'package:fiscal_focus_app/utils/colors.dart';
import 'package:fiscal_focus_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final PageController _controller = PageController();
  bool showDetailsPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  onPageChanged: (index) {
                    setState(() {
                      showDetailsPage = index == 3;
                    });
                  },
                  children: [
                    FirstPage(),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[0].title,
                      imgUrl: OnboardingData.onboardingDataList[0].imgUrl,
                      description:
                          OnboardingData.onboardingDataList[0].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[1].title,
                      imgUrl: OnboardingData.onboardingDataList[1].imgUrl,
                      description:
                          OnboardingData.onboardingDataList[1].description,
                    ),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[2].title,
                      imgUrl: OnboardingData.onboardingDataList[2].imgUrl,
                      description:
                          OnboardingData.onboardingDataList[2].description,
                    ),
                  ],
                ),
                //Page Indicator
                Container(
                  alignment: Alignment(0, .70),
                  child: SmoothPageIndicator(
                      controller: _controller,
                      count: 4,
                      effect: WormEffect(
                        activeDotColor: kBlack,
                        dotColor: kLightGrey,
                      )),
                ),
                Positioned(
                  bottom: 40,
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !showDetailsPage
                        ? GestureDetector(
                            onTap: () {
                              _controller.animateToPage(
                                _controller.page!.toInt() + 1,
                                duration: Duration(milliseconds: 400),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: CustomButton(
                              buttonName:
                                  showDetailsPage ? "Get Started" : "Next",
                              buttonColor: kYellow,
                            ),
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserDataScreen(),
                                ),
                              );
                            },
                            child: CustomButton(
                              buttonName:
                                  showDetailsPage ? "Get Started" : "Next",
                              buttonColor: kYellow,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
