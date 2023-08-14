import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:core/CORE/cubits/internet/internet_cubit.dart';
import 'package:core/CORE/cubits/main/main_cubit.dart';
import 'package:core/CORE/features/Home_Screen/view/home_screen.dart';
import 'package:core/CORE/features/chat/view/chat_screen.dart';
import 'package:core/CORE/utills/safe_print.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/internet_disconnected_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MainScreens extends StatefulWidget {
  const MainScreens({Key? key}) : super(key: key);

  @override
  State<MainScreens> createState() => _MainScreensState();
}

class _MainScreensState extends State<MainScreens> {
  MainCubit cubit = MainCubit();

  int index = 0;
  List<Widget> listScreens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    ChatScreen(),
    HomeScreen(),
    HomeScreen(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    checkConnectivity();
  }

  void checkConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    safePrint(result.name);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          return BlocBuilder<InternetCubit, InternetState>(
            builder: (context, state) {
              if (state is ConnectedState) {
                return SafeArea(
                  child: Scaffold(
                    body: cubit.screens[cubit.index],

                    bottomNavigationBar: bottomNavBar(),
                  ),
                );
              } else if (state is NotConnectedState) {
                InternetDisconnectedWidget();
              }
              return InternetDisconnectedWidget();
            },
          );
        },
      ),
    );
  }

  Widget bottomNavBar() {
    return BottomNavigationBar(

      showUnselectedLabels: true,showSelectedLabels: true,
      type: BottomNavigationBarType.shifting,
      unselectedLabelStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'poppins',fontSize: 12.sp),
      selectedLabelStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontFamily: 'poppins',fontSize: 12.sp),
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Colors.white70
          : Colors.grey.shade800,
      selectedItemColor: Colors.green,mouseCursor: MaterialStateMouseCursor.clickable,
      unselectedItemColor: Theme.of(context).brightness == Brightness.light
          ? Colors.black
          : Colors.white,
      onTap: (value) {
        cubit.index = value;
        setState(() {});
      },
      currentIndex: cubit.index,
      items: [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSVG(
                  assetName: 'home',
                  color: cubit.index == 0
                      ? Colors.green
                      : Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                ),
              ],
            )),
        BottomNavigationBarItem(
            label: 'Friends',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSVG(
                  assetName: 'addFriend',
                  width: 20.sp,
                  color: cubit.index == 1
                      ? Colors.green
                      : Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                ),
              ],
            )),
        BottomNavigationBarItem(
          label: 'Reels', // Empty label
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSVG(
                assetName: 'reel',
                color: cubit.index == 2
                    ? Colors.green
                    : Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
          label: 'Chat', // Empty label
          icon: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppSVG(
                assetName: 'chat',
                color: cubit.index == 3
                    ? Colors.green
                    : Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
              ),
            ],
          ),
        ),
        BottomNavigationBarItem(
            label: 'Notify',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppSVG(
                  assetName: 'bell',
                  color: cubit.index == 4
                      ? Colors.green
                      : Theme.of(context).brightness == Brightness.light
                          ? Colors.black
                          : Colors.white,
                ),
              ],
            )),
        BottomNavigationBarItem(
            label: 'Profile',
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 3.5.h,
                  child: CircleAvatar(
                    backgroundColor: cubit.index == 5
                        ? Colors.green
                        : Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,backgroundImage: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU"),
                  ),
                )              ],
            )),
      ],
    );
  }
}
