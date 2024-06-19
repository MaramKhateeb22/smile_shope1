import 'package:flutter/material.dart';
import 'package:smile_shope/Features/login/presentation/views/login_screen.dart';
import 'package:smile_shope/cache/cache_helper.dart';
import 'package:smile_shope/layout/homeScreen.dart';
import 'package:smile_shope/shared/components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String? image;
  final String? title;
  final String? body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class onBoardingScreen extends StatefulWidget {
  const onBoardingScreen({super.key});

  @override
  State<onBoardingScreen> createState() => _onBoardingScreenState();
}

class _onBoardingScreenState extends State<onBoardingScreen> {
  // GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  var pageController = PageController();
  bool isLast = false;
  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/images/img1.jpg',
        title: '!اختر ما تريد',
        body:
            'يحتوي المول الكثير من المنتجات \n المميزة والأنيقة التي يحتاجها الجنيع '),
    BoardingModel(
        image: 'assets/images/img2.jpg',
        title: 'سهولة الطلب',
        body:
            'اطلب ما تريد عن طريق الواتس اب \n والتواصل مع صاحب المتجر مباشرة '),
    BoardingModel(
        image: 'assets/images/img3.jpg',
        title: 'استلم طلبك',
        body: 'بعد طلب المنتج المراد يتم توصيله إليك \n بكل سرعة وسهولة '),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () {
              NavigateTo(
                context,
                SmileShopeHomeScreen(
                    // scaffoldkey: scaffoldKey,
                    ),
              );
            },
            child: const Text(
              'تخطي',
              style: TextStyle(fontSize: 25),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (int index) {
                if (index == boarding.length - 1) {
                  setState(() {
                    isLast = true;
                  });
                } else {
                  setState(() {
                    isLast = false;
                  });
                }
              },
              itemBuilder: (context, index) =>
                  buildOnBoardinItem(context, boarding[index]),
              controller: pageController,
              itemCount: boarding.length,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    pageController.previousPage(
                      duration: const Duration(milliseconds: 1000),
                      curve: Curves.easeInCirc,
                    );
                    // Do something when the button is pressed
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 102, 124, 220), width: 2),
                  ),
                  child: const Text(
                    'السابق',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const Spacer(),
              SmoothPageIndicator(
                  controller: pageController,
                  count: boarding.length,
                  effect: const JumpingDotEffect()),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MaterialButton(
                  onPressed: () {
                    if (isLast == true) {
                      CacheHelper()
                          .saveData(key: 'isONBoardingVisited', value: true);
                      // NavigateTo(
                      //     context,
                      //     SmileShopeHomeScreen(
                      //         // scaffoldkey: scaffoldKey,
                      //         ));
                      NavigateTo(
                        context,
                        const LoginScreen(),
                      );
                    }
                    pageController.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear);
                    // Do something when the button is pressed
                  },
                  color: Colors.blue,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.0),
                    side: const BorderSide(
                        color: Color.fromARGB(255, 85, 191, 245)),
                  ),
                  child: const Text(
                    'التالي',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget buildOnBoardinItem(context, BoardingModel? model) => Column(
      children: [
        Expanded(
          child: Image(
            image: AssetImage('${model!.image}'),
          ),
        ),
        Text(
          '${model.title}',
        ),
        Text(
          '${model.body}',
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
