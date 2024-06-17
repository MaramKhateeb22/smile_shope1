import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smile_shope/layout/cubit/state.dart';
import 'package:smile_shope/screens/screen1/screen1.dart';
import 'package:smile_shope/screens/screen2/screen2.dart';

class SmileShopeHomeCubit extends Cubit<SmileShopeHomeState> {
  SmileShopeHomeCubit() : super(SmileShopeInitialState());
  static SmileShopeHomeCubit get(context) => BlocProvider.of(context);

  int index = 0;
  List<Widget> screens = [
    const SmileShopeScreen1(),
    const SmileShopeScreen2(),
    const SmileShopeScreen1(),
    const SmileShopeScreen2(),
    const SmileShopeScreen1()
  ];
  void changeBottomNavigation(int value) {
    index = value;
    emit(ChangeBottomNavItemState());
  }
}
