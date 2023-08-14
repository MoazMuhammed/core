import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';


class MainChatWidget extends StatefulWidget {
  const MainChatWidget({Key? key}) : super(key: key);

  @override
  State<MainChatWidget> createState() => _MainChatWidgetState();
}

class _MainChatWidgetState extends State<MainChatWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 9.sp),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                      maxRadius: 3.5.h,
                      backgroundImage: const NetworkImage(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU',
                      )),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 0.4.w),
                        borderRadius: BorderRadius.circular(30.sp)),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 1.5.w),
                        borderRadius: BorderRadius.circular(30.sp),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          "userName",
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins'),
                        ),
                        const Spacer(),
                        Text(
                          "2 min ago",
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w800,
                              fontFamily: 'poppins',
                              color: Colors.grey),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 25.sp),
                      child: Text(
                        'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                        style: TextStyle(
                            fontSize: 15.5.sp,
                            fontWeight: FontWeight.w800,
                            fontFamily: 'poppins',
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey),
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 5.w,
              ),
              AppSVG(
                assetName: 'arrow',
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.black
                    : Colors.white60,
                height: 3.h,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
