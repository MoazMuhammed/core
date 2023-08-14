import 'package:core/CORE/utills/app_image.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widgets/comment_text_form_field.dart';

class ReplyBottomSheet extends StatefulWidget {
  @override
  ReplyBottomSheetState createState() => ReplyBottomSheetState();
}

class ReplyBottomSheetState extends State<ReplyBottomSheet> {
  TextEditingController replyController = TextEditingController();
  bool _isRowVisible = true;


  void _addreply(String comment) {
    replyController.clear();
    Navigator.pop(context); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 10.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CommentAppTextField(
                  hint: "Reply as Moaz Muhammed",
                  keyboardType: TextInputType.text,
                  controller: replyController,
                  isPassword: false,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
