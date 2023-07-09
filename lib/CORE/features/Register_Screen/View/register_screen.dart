import 'package:core/CORE/features/Login_Screen/View/login_screen.dart';
import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/navigators.dart';
import 'package:core/CORE/widgets/app_button.dart';
import 'package:core/CORE/widgets/text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? AppColors.backGround
            : Colors.black,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.sp, vertical: 30.sp),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SIGN UP',
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
                  'Sign up to get started!',
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
                  hint: 'FULL NAME',
                  prefixIcon: const Icon(
                    Icons.person_outline_outlined,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.name,
                  controller: fullNameController,
                  isPassword: false,
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.name,
                ),
                SizedBox(
                  height: 1.h,
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
                  textInputAction: TextInputAction.next,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(
                  height: 1.5.h,
                ),
                AppTextField(
                  hint: 'confirm Password',
                  prefixIcon: const Icon(
                    Icons.lock_open,
                    color: Colors.black,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  controller: confirmPasswordController,
                  isPassword: true,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 2.h,),
                AppButton(
                  onPressed: () {},
                  label: "SIGN UP",
                  sizeFont: 17.sp,
                  borderRadius: BorderRadius.all(
                    Radius.circular(16.sp),
                  ),
                  bgColor: Colors.black,
                  padding: EdgeInsets.symmetric(vertical: 2.h),
                  margin: EdgeInsets.symmetric(horizontal: 0.w),
                ),
                SizedBox(height: 0.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Text(
                        'Already have an account?',
                        style: TextStyle(
                            fontSize: 16.6.sp,
                            color: Theme.of(context).brightness == Brightness.light
                                ? AppColors.greyColor
                                : AppColors.greyColor),

                      ),
                    ),
                    SizedBox(width: 1.5.w),
                    TextButton(onPressed: () {
                      push(context, const LoginScreen());
                    }, child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 16.6.sp,
                        color: Colors.black,
                      ),

                    ),)

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
