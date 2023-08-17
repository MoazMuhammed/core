import 'package:core/CORE/features/Add%20Post/view/add_post_screen.dart';
import 'package:core/CORE/features/Home_Screen/widget/post_widget/bottom_sheet_widget.dart';
import 'package:core/CORE/features/Home_Screen/widget/post_widget/post_widget.dart';
import 'package:core/CORE/features/Home_Screen/widget/story_widget.dart';
import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/app_image.dart';
import 'package:core/CORE/utills/navigators.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/app_bar_home.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:story/story.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _widgetVisible = false;

  void _toggleWidgetVisibility() {
    setState(() {
      _widgetVisible = !_widgetVisible;
    });
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        backgroundColor: Theme.of(context).brightness == Brightness.light
        ? AppColors.backGround
        : Colors.black26,
        body: Padding(
      padding: EdgeInsets.symmetric(horizontal: 14.sp),
      child: Column(
        children: [
          AppBarMain(
            homeText: 'Core Posts',
            firstIconName: 'search',
            secondIconName: 'plus',
            firstOnPressed: () {},
            secondOnPressed: () { push(context, AddPostScreen());
            },
          ),
          SizedBox(
            height: 2.h,
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) =>  PostWidget(
              profileImage:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU',
              userName: 'Moaz Muhammed',
              postDate: '1h',
              postImage:
              'https://images.hdqwalls.com/download/dark-flow-facets-nm-1280x720.jpg',
              postLike: '20',
              postComment: '2',
              postSeen: '177',
              postTitle:
              'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.', postLikeClickAction: () { }, postCommentClickAction: () {             showModalBottomSheet(
                context: context,
                builder: (context) => CommentBottomSheet(commentImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU',
                    commentOwnerName: 'Moaz Muhammed', commentTime: '1h', commentTitle: 'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                    commentLike: '20', commentSeen: '177', likePress: () {

                    }, replyImage: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU', replyOwnerName: 'Moaz Muhammed',
                  replyTime: '1h', replyTitle: 'Flutter is Google’s mobile UI open source framework', replyLike: '20', replySeen: '170', replyLikePress: () {  },),
              );
              }, postSeenClickAction: () {  },
            ),itemCount: 7,),
          ),
        ],
      ),
        ),

      ),
    );
  }
}
