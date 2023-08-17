import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AppBarMain extends StatefulWidget {
  const AppBarMain({Key? key, required this.homeText, required this.firstIconName, required this.secondIconName, required this.firstOnPressed, required this.secondOnPressed,}) : super(key: key);
  final String homeText;
  final String firstIconName;
  final String secondIconName;
  final VoidCallback firstOnPressed;
  final VoidCallback secondOnPressed;

  @override
  State<AppBarMain> createState() => _AppBarMainState();
}

class _AppBarMainState extends State<AppBarMain> {
  bool _isSearchBarExpanded = false;
  bool isTextFieldVisible = false;


  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Theme.of(context).brightness == Brightness.light
                            ? AppColors.black
                            : Colors.white, // Set the color of the blue line
                        width: 5.sp,         // Set the width of the blue line
                      ),
                    ),
                  ),
                  child: Column(
                    children: [
                      if (!isTextFieldVisible)
                        Text(widget.homeText,style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,fontFamily: 'poppins')),
                    ],
                  ),
                ),
              ],
            ),
            if (!isTextFieldVisible)

              const Spacer(),
            InkWell(
              onTap: () {
            setState(() {
            isTextFieldVisible = !isTextFieldVisible;
            });
            },
              child:
    Column(
      children: [
          Container(
        decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade300
                        : AppColors.greyColor,borderRadius: BorderRadius.circular(18.sp)),
                    child: AppSVG(assetName: widget.firstIconName, width: 7.w,color: Theme.of(context).brightness == Brightness.light
                        ? AppColors.black
                        : Colors.white,),
                  ),
      ],
    ),
            ),
            if (isTextFieldVisible)
              Expanded(child: AppTextField(hint: "hint", keyboardType: TextInputType.text, controller: TextEditingController(), isPassword: false, textInputAction: TextInputAction.search, textInputType: TextInputType.text))

    ,SizedBox(
              width: 2.w,
            ),
            InkWell(
              onTap: widget.secondOnPressed,
              child: Container(
                decoration: BoxDecoration(color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey.shade300
                    : AppColors.greyColor,borderRadius: BorderRadius.circular(18.sp)),
                child: AppSVG(assetName: widget.secondIconName, width: 7.w,color: Theme.of(context).brightness == Brightness.light
                    ? AppColors.black
                    : Colors.white,),
              ),
            ),
          ],
        )
      ],
    );
  }
}
