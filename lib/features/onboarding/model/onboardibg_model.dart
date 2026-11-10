class OnboardibgModel {
  final String image;
  final String title;
  final String description;

  OnboardibgModel({
    required this.image,
    required this.title,
    required this.description,
  });

  static List<OnboardibgModel> onboardingList = [
    OnboardibgModel(
      image: "images/onboarding-1.png",
      title: "Trending News ",
      description: "Stay in the loop with the biggest breaking stories in a stunning visual slider. Just swipe to explore what’s trending right now!",
    ),
    OnboardibgModel(
      image: "images/onboarding-2.png",
      title: "Pick What You Love",
      description: "No more endless scrolling! Tap into your favorite topics like Tech, Politics, or Sports and get personalized news in seconds",
    ),
    OnboardibgModel(
      image: "images/onboarding-3.png",
      title: "Save It. Read It Later. Stay Smart.",
      description: "Found something interesting? Tap the bookmark and come back to it anytime. Never lose a great read again!",
    ),
  ];
}
