import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/app_image.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? AppColors.backGround
          : Colors.black26,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 18.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AppBarMain(
              homeText: 'Welcome',
              firstIconName: 'search',
              secondIconName: 'addPost',
              firstOnPressed: () {},
              secondOnPressed: () {},
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 7.h,
                      width: 18.w,
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(15.sp)),
                      child: AppSVG(
                        assetName: 'plus',
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.black
                            : Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      height: 7.h,

                      width: 18.w,
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.sp, vertical: 5.sp),
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.2.w, color: Colors.green),
                          borderRadius: BorderRadius.circular(14.sp)),
                      child: AppImage(
                          imageUrl:
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU",
                          width: 20.w,
                          height: 10.w,
                          borderRadius: BorderRadius.circular(14.sp)),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      ),
    ));
  }
}
