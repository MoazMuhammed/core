import 'package:core/CORE/features/Home_Screen/widget/post_widget/popUpMenu_widget.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'reply_bottom_sheet_widget.dart';

class CommentWidget extends StatefulWidget {
  const CommentWidget({super.key, required this.commentImage, required this.commentOwnerName, required this.commentTime, required this.commentTitle, required this.commentLike, required this.commentSeen, required this.likePress,  this.replyIcon = '',  this.replyTitle = ''});
  final String commentImage;
  final String commentOwnerName;
  final String commentTime;
  final String commentTitle;
  final String commentLike;
  final String commentSeen;
  final VoidCallback likePress;
  final String replyIcon;
  final String replyTitle;

  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
         CircleAvatar(
            backgroundImage: NetworkImage(
               widget.commentImage)),
        Expanded(
          child: Column(
            children: [
              SizedBox(height: 1.5.h,),
              Row(
                children: [
                  SizedBox(
                    width: 2.w,
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    widget.commentOwnerName,
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins'),
                  ),
                  const Spacer(),
                  Text(
                    widget.commentTime,
                    style: TextStyle(
                        fontSize: 13.sp,color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'poppins'),

                  ),
                  const PopUpMenuWidget(),
                  SizedBox(
                    width: 2.w,
                  ),

                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.sp, vertical: 0.sp),
                child: ReadMoreText(
                  widget.commentTitle,
                  trimLines: 2,
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'poppins'),
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  lessStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                  moreStyle: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.sp, vertical: 6.sp),
                child: Row(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: widget.likePress,
                          child: AppSVG(
                            assetName: 'heart',
                            height: 2.5.h,
                            color: Theme.of(context).brightness ==
                                Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          widget.commentLike,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins'),
                        )
                      ],
                    ),
                    SizedBox(width: 10.w),
                    Row(
                      children: [
                        AppSVG(
                          assetName: 'eye',
                          height: 2.5.h,
                          color: Theme.of(context).brightness ==
                              Brightness.light
                              ? Colors.black
                              : Colors.white,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Text(
                          widget.commentSeen,
                          style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins'),
                        )
                      ],
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () => showModalBottomSheet(context: context, builder: (context) => SizedBox(
                          height: 10.5.h,
                          child: ReplyBottomSheet()),),
                      child: Row(
                        children: [
                          AppSVG(
                            assetName: widget.replyIcon,
                            height: 2.5.h,
                            color: Theme.of(context).brightness ==
                                Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),
                          SizedBox(width: 1.5.w,),
                          Text(widget.replyTitle,style: TextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),)
                        ],
                      ),
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}
