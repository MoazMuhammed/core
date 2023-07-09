import 'package:core/CORE/features/Login_Screen/View/login_screen.dart';
import 'package:core/CORE/features/Register_Screen/View/register_screen.dart';
import 'package:core/CORE/shared_preferences/my_shared.dart';
import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/navigators.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  double buttonOpacity = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      if (MyShared.isFirstOpen()) {
        pushReplacement(context, LoginScreen());
        return;
      }

      if (MyShared.isLoggedIn()) {
        pushReplacement(context, const RegisterScreen());
      } else {
        pushReplacement(context, const LoginScreen());
      }
    });

    Future.delayed(
      const Duration(milliseconds: 1500),
          () {
        buttonOpacity = 1;
        setState(() {});
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.backGround
          : AppColors.black,
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      height: 40.sp,
                      width: 40.sp,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceOut,
                      child: AppSVG(
                        height: 30.h,
                        width: 20.w,
                        assetName: 'logo',
                      ),
                    ),
                    SizedBox(height: 1.h,),
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.bounceInOut,
                      opacity: buttonOpacity,
                      child: Text(
                        "Core",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Theme.of(context).brightness == Brightness.light
                              ? AppColors.black
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
