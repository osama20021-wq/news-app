import 'package:flutter/material.dart';

class OnboardingController extends ChangeNotifier {
  final PageController pageController = PageController();
  int currentIndex = 0;
  bool isLastPage = false;
  void getPage(int index) {
    if (index == 2) {
      isLastPage = true;
    } else {
      isLastPage = false;
    }
    currentIndex = index;
    notifyListeners();
  }
}
