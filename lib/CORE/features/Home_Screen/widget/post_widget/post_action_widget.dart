import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PostActionWidget extends StatefulWidget {
  const PostActionWidget({super.key, required this.postLAction, required this.postLIconAction, required this.postClickAction});
  final String postLAction;
  final String postLIconAction;
  final VoidCallback postClickAction;
  @override
  State<PostActionWidget> createState() => _PostActionWidgetState();
}

class _PostActionWidgetState extends State<PostActionWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.postClickAction,
      child: Row(
        children: [
          AppSVG(
            assetName: widget.postLIconAction,
            height: 2.5.h,
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.black
                : Colors.white,
          ),
          SizedBox(
            width: 2.5.w,
          ),
          Text(
            widget.postLAction,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
                fontFamily: 'poppins'),
          )
        ],
      ),
    );
  }
}
