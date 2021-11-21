class OnBoarding {
  final String title;
  final String description;
  final String image;

  OnBoarding(
      {required this.title, required this.description, required this.image});
  
}

List<OnBoarding> onBoardingContents = [
  OnBoarding(
    title: "Welcome to the app",
    description: "This is a description",
    image: "assets/images/onboarding0.gif",
  ),
  OnBoarding(
    title: "Welcome to the app",
    description: "This is a description",
    image: "assets/images/onboarding1.gif",
  ),
  OnBoarding(
    title: "Welcome to the app",
    description: "This is a description",
    image: "assets/images/onboarding2.gif",
  ),
];
