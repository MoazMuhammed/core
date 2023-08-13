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

  void _addComment(String comment) {
    _commentController.clear();
    Navigator.pop(context); // Close the bottom sheet
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 12.sp,horizontal: 20.sp),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) =>  Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const CircleAvatar(
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU')),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,

                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,

                        children: [
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [
                              SizedBox(
                                height: 0.5.h,
                              ),

                              Text(
                                "userName",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins'),
                              ),
                              Text(
                                "21-02-2002",
                                style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'poppins'),
                              ),
                            ],
                          ),
                          const Spacer(),
                           AppSVG(
                            assetName: 'menu',
                            color: Theme.of(context).brightness == Brightness.light
                                ? Colors.black
                                : Colors.white,
                          ),

                        ],
                      ),
                      SizedBox(
                        height: 1.0.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.sp, vertical: 0.sp),
                        child: ReadMoreText(
                          'Flutter is Google’s mobile UI open source framework to build high-quality native (super fast) interfaces for iOS and Android apps with the unified codebase.',
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
                                  color: Theme.of(context).brightness == Brightness.light
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
                            SizedBox(width:10.w),
                            Row(
                              children: [
                                AppSVG(
                                  assetName: 'eye',
                                  height: 2.h,
                                  color: Theme.of(context).brightness == Brightness.light
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
                      Row(children: [
                       Container(

                         decoration: BoxDecoration(border: Border.all(color: Colors.grey,width: 0.1.w,)),
                       width: 10.w,
                       ),
                        SizedBox(width: 5.w,),
                        Center(
                          child: TextButton(onPressed: () {

                          }, child: Text("View 1 more Reply",style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),),),
                        )
                      ],),

                      SizedBox(height: 20.sp,)

                    ],
                  ),
                ),            ],),itemCount: 7,),
          ),

          Row(
            children: [
              Expanded(
                child: CommentAppTextField(hint: "Comment as Moaz Muhammed", keyboardType: TextInputType.text, controller: _commentController, isPassword:  false, textInputAction: TextInputAction.done, textInputType: TextInputType.text,),
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
