import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/main/main_screen.dart';
import 'package:flutter_application_1/features/onboarding/manager/onboarding_controller.dart';
import 'package:flutter_application_1/features/onboarding/model/onboardibg_model.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OnboardingController(),
      builder: (context, child) {
        final readController = context.read<OnboardingController>();

        return Scaffold(
          appBar: AppBar(
            actions: [
              Consumer<OnboardingController>(
                builder: (context, value, child) => value.isLastPage
                    ? SizedBox()
                    : Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
          body: SafeArea(
            child: PageView.builder(
              controller: readController.pageController,
              itemCount: OnboardibgModel.onboardingList.length,
              onPageChanged: (value) => readController.getPage(value),
              itemBuilder: (context, index) {
                final OnboardibgModel model =
                    OnboardibgModel.onboardingList[index];
                return Column(
                  children: [
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(color: Color(0xFFf5f5f5)),
                      child: Column(
                        crossAxisAlignment: .end,
                        children: [Center(child: Image.asset(model.image))],
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            children: [
                              SizedBox(height: 24),
                              Text(
                                model.title,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              SizedBox(height: 12),
                              Text(
                                model.description,
                                style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 24),
                        SmoothPageIndicator(
                          controller: readController.pageController,
                          count: 3,
                          effect: WormEffect(
                            dotColor: Color(0xFFD3D3D3),
                            activeDotColor: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Theme.of(context).primaryColor,
                          foregroundColor: Color(0xFFFFFFFF),
                          fixedSize: Size(double.maxFinite, 50),
                        ),
                        onPressed: () {
                          if (readController.isLastPage) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainScreen(),
                              ),
                            );
                          }
                          readController.pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                        child: Consumer<OnboardingController>(
                          builder: (context, value, child) => Text(
                            value.isLastPage ? "Get Started" : "Next",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
