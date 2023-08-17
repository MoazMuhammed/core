import 'package:core/CORE/features/Home_Screen/widget/post_widget/bottom_sheet_item_widget.dart';
import 'package:core/CORE/features/Home_Screen/widget/post_widget/reply_bottom_sheet_widget.dart';
import 'package:core/CORE/utills/app_image.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widgets/comment_text_form_field.dart';

class CommentBottomSheet extends StatefulWidget {
  const CommentBottomSheet({super.key, required this.commentImage, required this.commentOwnerName, required this.commentTime, required this.commentTitle, required this.commentLike, required this.commentSeen, required this.likePress, required this.replyImage, required this.replyOwnerName, required this.replyTime, required this.replyTitle, required this.replyLike, required this.replySeen, required this.replyLikePress});
  final String commentImage;
  final String commentOwnerName;
  final String commentTime;
  final String commentTitle;
  final String commentLike;
  final String commentSeen;
  final VoidCallback likePress;
  final String replyImage;
  final String replyOwnerName;
  final String replyTime;
  final String replyTitle;
  final String replyLike;
  final String replySeen;
  final VoidCallback replyLikePress;

  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {

  TextEditingController _commentController = TextEditingController();

  void _addComment(String comment) {
    _commentController.clear();
    Navigator.pop(context); // Close the bottom sheet
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 15.w,
              decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 0.4.w,),borderRadius: BorderRadius.circular(30.sp)),
            ),
          ),
          SizedBox(height: 2.h,),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => BottomSheetItemWidget(commentImage: widget.commentImage, commentOwnerName: widget.commentOwnerName, commentTime: widget.commentTime,
                  commentTitle: widget.commentTitle, commentLike: widget.commentLike, commentSeen: widget.commentSeen, likePress: widget.likePress, replyImage: widget.replyImage,
                  replyOwnerName: widget.replyOwnerName, replyTime: widget.replyTime, replyTitle: widget.replyTitle, replyLike: widget.replyLike, replySeen: widget.replySeen,
                  replyLikePress: widget.replyLikePress),
              itemCount: 7,
            ),
          ),

          Row(
            children: [
              Expanded(
                child: CommentAppTextField(
                  hint: "Comment as Moaz Muhammed",
                  keyboardType: TextInputType.text,
                  controller: _commentController,
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


