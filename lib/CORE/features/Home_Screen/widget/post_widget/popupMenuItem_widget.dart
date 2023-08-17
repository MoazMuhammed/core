import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopUpMenuItemWidget extends StatefulWidget {
  const PopUpMenuItemWidget({super.key, required this.menuIcon, required this.menuTitle});
  final String menuIcon;
  final String menuTitle;

  @override
  State<PopUpMenuItemWidget> createState() => _PopUpMenuItemWidgetState();
}

class _PopUpMenuItemWidgetState extends State<PopUpMenuItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSVG(assetName: widget.menuIcon,color: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.white)  ,
        Container(
            height: 2.h,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 0.2.w, ))),
        SizedBox(width: 1.w,),
        Text(widget.menuTitle,     style: TextStyle(
            color: Theme.of(context).brightness == Brightness.light
                ? Colors.grey
                : Colors.white,
            fontSize: 13.5.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'poppins'),),
      ],
    );
  }
}
