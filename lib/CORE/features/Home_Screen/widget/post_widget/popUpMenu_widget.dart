import 'package:core/CORE/features/Home_Screen/widget/post_widget/popupMenuItem_widget.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PopUpMenuWidget extends StatefulWidget {
  const PopUpMenuWidget({super.key});

  @override
  State<PopUpMenuWidget> createState() => _PopUpMenuWidgetState();
}

class _PopUpMenuWidgetState extends State<PopUpMenuWidget> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadiusDirectional.circular(30.sp)),
      onSelected: (value) {
        // Execute different actions based on the selected value
        if (value == "Report") {
          // Perform action for "Report" option
          // ...
        } else if (value == "UnFriend") {
          // Perform action for "UnFriend" option
          // ...
        } else if (value == "About this account") {
          // Perform action for "About this account" option
          // ...
        }
      },
      itemBuilder: (context) => [
        const PopupMenuItem(
          value: "report",
          child: PopUpMenuItemWidget(menuIcon: 'report', menuTitle: "Report"),
        ),
        const PopupMenuItem(
          value: "UnFriend",
          child: PopUpMenuItemWidget(menuIcon: 'unFriend', menuTitle: 'UnFriend')
        ),
        const PopupMenuItem(
          value: "About this account",
          child: PopUpMenuItemWidget(menuIcon: 'aboutFriend', menuTitle: "About This Account"),
        ),
      ],
      child: AppSVG(
        assetName: 'menu',
        color: Theme.of(context).brightness == Brightness.light
            ? Colors.black
            : Colors.grey,
      ),
    );
  }
}
