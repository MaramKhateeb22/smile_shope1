import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:smile_shope/Features/login/presentation/manager/login_cubit.dart';
import 'package:smile_shope/Features/register/presentation/manager/cubit/register_cubit.dart';
import 'package:smile_shope/cache/cache_helper.dart';
import 'package:smile_shope/screens/splash/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  runApp(const SmileShope());
}

class SmileShope extends StatelessWidget {
  const SmileShope({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginCubit>(create: (context) => LoginCubit()),
        BlocProvider<RegisterCubit>(create: (context) => RegisterCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
        ],
        locale: const Locale("ar", "AE"),
        home: const SplashSreen(),
        //  onBoardingScreen(),
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            elevation: 0,
            titleTextStyle: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
          ),
          scaffoldBackgroundColor: Colors.white,
          primaryColor: Colors.red, // تعيين اللون الافتراضي
          textTheme: const TextTheme(
            bodySmall: TextStyle(
                fontSize: 20, color: Colors.black), // تعيين حجم الخط الافتراضي
            bodyMedium:
                TextStyle(fontSize: 25, color: Colors.black), // حجم خط آخر
            // textTheme: const TextTheme(
            //   bodySmall: TextStyle(color: Colors.black, fontSize: 25),
            // ),
          ),
        ),
      ),
    );
  }
}
