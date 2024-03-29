import 'package:core/CORE/features/Home_Screen/view/home_screen.dart';
import 'package:core/CORE/features/Search_Screen/search_screen.dart';
import 'package:core/CORE/features/chat/view/chat_screen.dart';
import 'package:core/CORE/features/reels/widget/reel_swipe_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  int index = 0;

  List<Widget> screens = [
    HomeScreen(),
    SearchScreen(),
    Reels(),
    ChatScreen(),
    HomeScreen(),
    HomeScreen(),


  ];

  void backToHome() {
    index = 0;
    emit(BackHomeState());
  }

  void switchToAppointmentScreen() {
    index = 4;
    emit(SwitchToAppointmentScreen());
  }

  void switchToProfileScreen() {
    index = 3;
    emit(SwitchToProfileScreen());
  }
}
