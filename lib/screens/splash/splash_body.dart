import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smile_shope/Features/login/presentation/views/login_screen.dart';
import 'package:smile_shope/cache/cache_helper.dart';
import 'package:smile_shope/layout/homeScreen.dart';
import 'package:smile_shope/screens/onboarding/onboarding.dart';

import '../../shared/components/constants.dart';
import '../../shared/widgets/sliding_-text.dart';

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
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Image.asset(AssetsData.logo),
        // Image.asset('assets/images/Logo-removebg-preview.png'),
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
    bool isONBoardingVisited =
        CacheHelper().getData(key: 'isONBoardingVisited') ?? false;
    bool isLogin = CacheHelper().getData(key: 'isLogin') ?? false;
    bool isRegister = CacheHelper().getData(key: 'isRegister') ?? false;
    print('isLogin:' '$isLogin' 'isRegister:' '$isRegister');
    if (isONBoardingVisited == true) {
      print('$isONBoardingVisited' '\n');
      if (isLogin == true || isRegister == true) {
        Timer(const Duration(seconds: 3), () {
          Get.offAll(() => SmileShopeHomeScreen(),
              transition: Transition.fade, duration: ktranstionDuration);
        });
      } else {
        Timer(const Duration(seconds: 3), () {
          Get.offAll(() => const LoginScreen(),
              transition: Transition.fade, duration: ktranstionDuration);
        });
      }
    } else {
      Timer(const Duration(seconds: 3), () {
        Get.offAll(() => const onBoardingScreen(),
            transition: Transition.fade, duration: ktranstionDuration);
      });
    }

    // Future.delayed(
    //  const Duration(seconds: 3),
    //  (){
    //    Get.to(()=> const onBoardingScreen(),transition: Transition.fade ,duration: ktranstionDuration);
    //  }
    //     );
  }
}
