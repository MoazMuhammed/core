import 'package:core/CORE/features/Register_Screen/View/register_screen.dart';
import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/navigators.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:core/CORE/widgets/app_button.dart';
import 'package:core/CORE/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.backGround
            : Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 25.sp,vertical: 30.sp


          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppSVG(assetName: "logo", height: 20.h),
                Text(
                  'LOGIN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.sp,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                  ),
                ),
                //const SizedBox(height: 5,),
                Text(
                  'Sign in to continue!',
                  style: TextStyle(
                      fontSize: 18.sp,
                      color: Theme.of(context).brightness == Brightness.light
                          ? AppColors.greyColor
                          : AppColors.greyColor),
                ),
                SizedBox(
                  height: 6.h,
                ),

                AppTextField(
                  hint: 'Email Address',
                  prefixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  controller: emailController,
                  isPassword: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: 1.h,
                ),
                AppTextField(
                  hint: 'Password',
                  prefixIcon: const Icon(
                    Icons.lock_open,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  isPassword: true,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                AppButton(
                  onPressed: () {},
                  label: "LOGIN",
                  sizeFont: 17.sp,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.sp),
                  ),
                  bgColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  margin: EdgeInsets.symmetric(horizontal: 0.w),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Don’t have an account?',
                        style: TextStyle(
                            fontSize: 16.5.sp,
                            color:
                                Theme.of(context).brightness == Brightness.light
                                    ? AppColors.greyColor
                                    : AppColors.greyColor),
                      ),
                    ),
                    SizedBox(width: 1.5.w),
                    TextButton(onPressed: () {
                      push(context, RegisterScreen());
                    }, child:                     Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 16.5.sp,
                        color: Colors.black,
                      ),
                    ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
