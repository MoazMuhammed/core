import 'package:core/CORE/features/Home_Screen/widget/post_widget/post_action_widget.dart';
import 'package:core/CORE/utills/app_image.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostWidget extends StatefulWidget {
  const PostWidget({super.key, required this.profileImage, required this.userName, required this.postDate, required this.postImage, required this.postLike, required this.postComment, required this.postSeen, required this.postTitle, required this.postLikeClickAction, required this.postCommentClickAction, required this.postSeenClickAction});
  final String profileImage;
  final String userName;
  final String postDate;
  final String postImage;
  final String postLike;
  final String postComment;
  final String postSeen;
  final String postTitle;
  final VoidCallback postLikeClickAction;
  final VoidCallback postCommentClickAction;
  final VoidCallback postSeenClickAction;

  @override
  State<PostWidget> createState() => _PostWidgetState();
}

class _PostWidgetState extends State<PostWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.symmetric(vertical: 8.sp),
      padding: EdgeInsets.symmetric(horizontal: 15.sp,vertical: 15.sp),
      decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.light
          ? Colors.white70
          : Colors.grey.withOpacity( 0.4.sp),borderRadius: BorderRadius.circular(14.sp)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               CircleAvatar(
                  backgroundImage: NetworkImage(widget.profileImage)),
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 0.7.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 2.w,
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),

                        Text(
                          widget.userName,
                          style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins'),
                        ),
                        const Spacer(),
                        Text(
                          widget.postDate,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'poppins'),
                        ),
                        SizedBox(
                          width: 0.5.h,
                        ),

                        AppSVG(
                          assetName: 'menu',
                          color: Theme.of(context).brightness == Brightness.light
                              ? Colors.black
                              : Colors.white,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 1.0.h,
                    ),
                    AppImage(
                        imageUrl:
                        widget.postImage,
                        width: double.infinity,
                        height: 20.h,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16.sp),
                            bottomRight: Radius.circular(16.sp),
                            topRight: Radius.circular(16.sp),
                        topLeft:Radius.circular(8.sp) )),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.sp, vertical: 10.sp),
                      child: Row(
                        children: [
                          PostActionWidget(postLAction: widget.postLike, postLIconAction: 'heart', postClickAction: widget.postLikeClickAction,)    ,
                          SizedBox(
                            width: 9.w,
                          ),
                          PostActionWidget(postLAction: widget.postComment, postLIconAction: 'comment', postClickAction: widget.postCommentClickAction,)    ,
                          SizedBox(
                            width: 9.w,
                          ),
                          PostActionWidget(postLAction: widget.postSeen, postLIconAction: 'eye', postClickAction: widget.postSeenClickAction,)    ,
                          const Spacer(),
                          AppSVG(
                            assetName: 'save',
                            height: 2.5.h,
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.sp, vertical: 0.sp),
                      child: ReadMoreText(
                        widget.postTitle,
                        trimLines: 2,
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    )
    ;
  }
}
