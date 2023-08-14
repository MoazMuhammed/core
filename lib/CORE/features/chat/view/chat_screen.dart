import 'package:core/CORE/features/chat/widget/chat_widget.dart';
import 'package:core/CORE/widgets/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
            Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => MainChatWidget(),
                    separatorBuilder: (context, index) => Divider(),
                    itemCount: 12))
          ],
        ),
      ),
    ));
  }
}
