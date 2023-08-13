import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.sp,vertical: 20.sp),
        child: Column(children: [
          Row(children: [
            const CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQP7ARHenfnGXcxCIhmDxObHocM8FPbjyaBg&usqp=CAU")),
            SizedBox(
              width: 2.w,
            ),
            Text("UserName",style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,fontFamily: 'poppins')),
          ]),
          Expanded(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Enter your text',
                border: InputBorder.none, // No border
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
