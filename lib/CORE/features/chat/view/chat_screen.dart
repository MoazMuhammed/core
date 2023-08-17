import 'package:core/CORE/features/Home_Screen/widget/story_widget.dart';
import 'package:core/CORE/features/chat/widget/chat_widget.dart';
import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/app_image.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story/story.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 14.sp),
        child: Column(
          children: [
            AppBarMain(
              homeText: 'chats',
              firstIconName: 'search',
              secondIconName: 'plus',
              firstOnPressed: () {},
              secondOnPressed: () {},
            ),
            SizedBox(height: 2.3.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 9 .h,
                  width: 18.w,
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(15.sp),
                  ),
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
                Expanded(
                  child: SizedBox(
                    height: 9.h,
                    width: 18.w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => StoryWidget(
                        storyOnPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StoryPageView(
                                    itemBuilder: (context, pageIndex,
                                            storyIndex) =>
                                        SafeArea(
                                            child: Scaffold(
                                          body: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 20.sp,
                                                vertical: 10.sp),
                                            child: Stack(
                                              alignment: Alignment.topLeft,
                                              children: [
                                                AppImage(
                                                    imageUrl:
                                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU",
                                                    width: double.infinity,
                                                    height: double.infinity,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14.sp)),
                                                Row(
                                                  children: [
                                                    AppImage(
                                                        imageUrl:
                                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU",
                                                        width: 10.w,
                                                        height: 10.w,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    14.sp)),
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    const Text("UserName"),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        )),
                                    storyLength: (pageIndex) => 7,
                                    pageLength: 3)),
                          );
                        },
                      ),
                      itemCount: 7,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 2.h,
            ),

            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => const MainChatWidget(),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: 12))
          ],
        ),
      ),
    ));
  }
}
