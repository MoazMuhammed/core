import 'package:core/CORE/features/Home_Screen/widget/post_widget/reply_bottom_sheet_widget.dart';
import 'package:core/CORE/utills/app_image.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widgets/comment_text_form_field.dart';

class CommentBottomSheet extends StatefulWidget {
  @override
  _CommentBottomSheetState createState() => _CommentBottomSheetState();
}

class _CommentBottomSheetState extends State<CommentBottomSheet> {
  TextEditingController _commentController = TextEditingController();
  bool _isRowVisible = true;


  void _addComment(String comment) {
    _commentController.clear();
    Navigator.pop(context); // Close the bottom sheet
  }

  void toggleRowVisibility() {
    setState(() {
      _isRowVisible = !_isRowVisible;
    });
  }
  List <Model> model = [
    Model("title")

  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU')),
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
                              "Moaz Muhammed",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins'),
                            ),
                            const Spacer(),
                            Text(
                              "1h",
                              style: TextStyle(
                                  fontSize: 12.sp,color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'poppins'),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            AppSVG(
                              assetName: 'menu',height: 2.5.h,
                              color: Theme.of(context).brightness ==
                                      Brightness.light
                                  ? Colors.black
                                  : Colors.white,
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.sp, vertical: 0.sp),
                          child: ReadMoreText(
                            'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                            trimLines: 2,
                            style: TextStyle(
                                fontSize: 14.sp,
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
                                  AppSVG(
                                    assetName: 'heart',
                                    height: 2.h,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    '20',
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
                                    height: 2.h,
                                    color: Theme.of(context).brightness ==
                                            Brightness.light
                                        ? Colors.black
                                        : Colors.white,
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  Text(
                                    "150",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'poppins'),
                                  )
                                ],
                              ),
                              Spacer(),
                              GestureDetector(
                                onTap: () => showModalBottomSheet(context: context, builder: (context) => Container(
                                     height: 10.5.h,
                                    child: ReplyBottomSheet()),),
                                child: Row(
                                  children: [
                                    AppSVG(
                                      assetName: 'reply',
                                      height: 2.h,
                                      color: Theme.of(context).brightness ==
                                          Brightness.light
                                          ? Colors.black
                                          : Colors.white,
                                    ),
                                    SizedBox(width: 1.5.w,),
                                    Text("Add Reply",style: TextStyle(
                                        fontSize: 12.5.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey),)
                                  ],
                                ),
                              ),

                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: toggleRowVisibility,
                          child: AnimatedSwitcher(
                            duration: Duration(milliseconds: 300),
                            child:
                          Expanded(
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

                                  ListView.builder(

                                  itemCount: 1,
                                    itemBuilder: (context, index) =>
                                    Padding(
                                    key: ValueKey<bool>(_isRowVisible),
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU')),

                                        Column(
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
                                                  "Moaz Muhammed",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'poppins'),
                                                ),
                                                const Spacer(),
                                                Text(
                                                  "1h",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,color: Colors.grey,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'poppins'),
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                AppSVG(
                                                  assetName: 'menu',height: 2.5.h,
                                                  color: Theme.of(context).brightness ==
                                                      Brightness.light
                                                      ? Colors.black
                                                      : Colors.white,
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.sp, vertical: 0.sp),
                                              child: ReadMoreText(
                                                'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
                                                trimLines: 2,
                                                style: TextStyle(
                                                    fontSize: 14.sp,
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
                                                      AppSVG(
                                                        assetName: 'heart',
                                                        height: 2.h,
                                                        color: Theme.of(context).brightness ==
                                                            Brightness.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Text(
                                                        '20',
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
                                                        height: 2.h,
                                                        color: Theme.of(context).brightness ==
                                                            Brightness.light
                                                            ? Colors.black
                                                            : Colors.white,
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Text(
                                                        "150",
                                                        style: TextStyle(
                                                            fontSize: 14.sp,
                                                            fontWeight: FontWeight.bold,
                                                            fontFamily: 'poppins'),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20.sp,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),

                                ),

                              ],
                            ),
                          ),

                  ),
                        ),
                        SizedBox(
                          height: 20.sp,
                        )
                      ],
                    ),
                  ),
                ],
              ),
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

          // ElevatedButton(
          //   onPressed: () {
          //     _addComment(_commentController.text);
          //   },
          //   child: const Text('Add Comment'),
          // ),
        ],
      ),
    );
  }
}
class Model{
  final String title;

  Model(this.title);

}

