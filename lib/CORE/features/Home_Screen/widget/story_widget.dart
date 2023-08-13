import 'package:core/CORE/utills/app_image.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class StoryWidget extends StatelessWidget {
  const StoryWidget({super.key, required this.storyOnPressed});
  final VoidCallback storyOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: storyOnPressed,
          child: Container(
            height: 7.h,

            width: 18.w,
            padding: EdgeInsets.symmetric(
                horizontal: 5.sp, vertical: 5.sp),
            decoration: BoxDecoration(
                border: Border.all(width: 0.08.w, color: Colors.green),
                borderRadius: BorderRadius.circular(14.sp)),
            child: AppImage(
                imageUrl:
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU",
                width: 20.w,
                height: 10.w,
                borderRadius: BorderRadius.circular(14.sp)),
          ),
        ),
        SizedBox(width: 1.2.w,)

      ],
    )
    ;
  }
}
