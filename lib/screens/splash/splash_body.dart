import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../shared/components/constants.dart';
import '../../shared/utils/assets.dart';
import '../../shared/widgets/sliding_-text.dart';
import '../onboarding/onboarding.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingInimation();
     navigteToOnBoarding();
  }

  @override
  void dispose() {
    super.dispose();
    //  slidingAnimation.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(
          height: 25,
        ),
        slidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingInimation() {
    animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    slidingAnimation =
        Tween<Offset>(begin: const Offset(0, 10), end: Offset.zero)
            .animate(animationcontroller);
    animationcontroller.forward();
  }

  void navigteToOnBoarding() {
    Timer(Duration(seconds: 3), () {
      Get.offAll(() => const onBoardingScreen(),
          transition: Transition.fade, duration: ktranstionDuration);
    });
    // Future.delayed(
    //  const Duration(seconds: 3),
    //  (){
    //    Get.to(()=> const onBoardingScreen(),transition: Transition.fade ,duration: ktranstionDuration);
    //  }
    //     );
  }
}
