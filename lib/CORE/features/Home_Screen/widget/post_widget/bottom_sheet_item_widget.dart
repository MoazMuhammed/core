import 'package:core/CORE/features/Home_Screen/widget/post_widget/comment_widget.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BottomSheetItemWidget extends StatefulWidget {
  const BottomSheetItemWidget({super.key, required this.commentImage, required this.commentOwnerName, required this.commentTime, required this.commentTitle, required this.commentLike, required this.commentSeen, required this.likePress, required this.replyImage, required this.replyOwnerName, required this.replyTime, required this.replyTitle, required this.replyLike, required this.replySeen, required this.replyLikePress});
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
  State<BottomSheetItemWidget> createState() => _BottomSheetItemWidgetState();
}

class _BottomSheetItemWidgetState extends State<BottomSheetItemWidget> {
  bool _isRowVisible = true;

  void toggleRowVisibility() {
    setState(() {
      _isRowVisible = !_isRowVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommentWidget(commentImage: widget.commentImage, commentOwnerName: widget.commentOwnerName, commentTime: widget.commentTime, commentTitle: widget.commentTitle,
            commentLike: widget.commentLike, commentSeen: widget.commentSeen, likePress: widget.likePress, replyIcon: 'reply', replyTitle: 'Add Reply',),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.sp),
          child: GestureDetector(
            onTap: toggleRowVisibility,
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: Column(
                children: [
                  if (_isRowVisible)
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.1.w,
                              )),
                          width: 10.w,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Center(
                          child: TextButton(
                            onPressed: () {toggleRowVisibility();},
                            child: Text(
                              "View 1 more Reply",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  if (!_isRowVisible)
                    SizedBox(
                      width: double.infinity,
                      height: 20.h,
                      child: ListView.builder(itemCount: 3,
                        itemBuilder: (context, index) =>  Padding(
                          padding:  EdgeInsets.symmetric(vertical: 3.h),
                          child: CommentWidget(commentImage: widget.replyImage, commentOwnerName: widget.replyOwnerName, commentTime: widget.replyTime, commentTitle: widget.replyTitle,
                              commentLike: widget.replyLike, commentSeen: widget.replySeen, likePress: widget.replyLikePress, replyIcon: '', replyTitle: '',),
                        ),
                      ),
                    ),




                ],
              ),

            ),
          ),
        ),


      ],
    );
  }
}
