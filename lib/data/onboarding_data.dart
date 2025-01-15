import 'package:fiscal_focus_app/models/onboarding_model.dart';

class OnboardingData {
  static final List<OnboardingModel> onboardingDataList = [
    OnboardingModel(
      title: "Gain Total Control of Your Money",
      imgUrl: "assets/images/onboarding1.avif",
      description: "Become your own money manager and make every cent count",
    ),
    OnboardingModel(
      title: "Know Where Your Money Goes",
      imgUrl: "assets/images/onboarding2.jpg",
      description: "Track your transaction easily with categories and financial report ",
    ),
    OnboardingModel(
      title: "Planning Ahead",
      imgUrl: "assets/images/onboarding3.avif",
      description: "Setup your budget for each category so you in control",
    ),
  ];
}
