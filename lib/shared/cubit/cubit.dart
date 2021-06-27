import 'package:bloc/bloc.dart';
import 'package:dsc_world_app/screens/continents_screen.dart';
import 'package:dsc_world_app/screens/favourite_screen.dart';

import 'package:dsc_world_app/shared/cubit/states.dart';
import 'package:dsc_world_app/shared/network/cashe_helper.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<DscWorldStates> {
  AppCubit() : super(DscWorldInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<String> titles = [
    'COW',
    'Favourites',
  ];
  List<Widget> screens = [ContinentsScreen(), FavouriteScreen()];

  void changeIndex(int index) {
    currentIndex = index;
    emit(BottomNavBarState());
  }




  bool isDark = false;
  void changeAppMode({bool? sharedValue, bool? value}) {
    if (sharedValue != null) {
      isDark = sharedValue;
      emit(ChangeAppThemeState());
    } else {
      if (value == true) {
        isDark = true;
        CasheHelper.putData(key: 'isDark', value: isDark)
            .then((value) => emit(ChangeAppThemeState()));
      } else {
        isDark = false;
        CasheHelper.putData(key: 'isDark', value: isDark)
            .then((value) => emit(ChangeAppThemeState()));
      }
    }
  }
}
