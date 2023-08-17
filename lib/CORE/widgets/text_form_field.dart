import 'package:core/CORE/styles/colors.dart';
import 'package:core/CORE/utills/svg.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// ignore: must_be_immutable
class AppTextField extends StatefulWidget {
  AppTextField({
    Key? key,
    required this.hint,
    required this.keyboardType,
    this.borderRadius,
    this.margin,
    this.padding,
    this.textColor = Colors.black,
    this.icon,
    required this.controller,
    required this.isPassword,
    this.validators,
    required this.textInputAction,
    required this.textInputType,
    this.title = "",
    this.obscureText = false,
    this.enable,
    this.isImage = false,
    this.uploadMedicalId,
    this.prefixIcon,
  }) : super(key: key);
  final Color textColor;
  final String hint;
  final TextInputType keyboardType;
  final VoidCallback? uploadMedicalId;
  final String title;

  final bool isPassword;
  final bool isImage;
  final FormFieldValidator<dynamic>? validators;
  final TextEditingController controller;
  final TextInputAction textInputAction;
  final TextInputType textInputType;
  final IconData? icon;
  final bool? enable;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? margin;
  EdgeInsetsGeometry? padding;
  final Widget? prefixIcon;

  late bool obscureText;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).brightness == Brightness.light
                  ? Colors.grey.shade200
          : Colors.black26,
              blurStyle: BlurStyle.normal,
              offset: const Offset(5, 1),
              blurRadius: 14,
            ),
          ],
        ),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10.h,
                child: TextFormField(
                  validator: widget.validators,
                  obscureText: widget.obscureText,
                  controller: widget.controller,style: TextStyle(
                    fontSize: 14.sp,
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.black
                        : Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'poppins'),
                  enabled: widget.enable,
                  keyboardType: widget.textInputType,
                  textInputAction: widget.textInputAction,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.white
                        : Colors.black26,
                    // Set fill color to gray
                    border: OutlineInputBorder(
                      borderSide:  BorderSide(color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Colors.black26,),
                      // Set border color to white
                      borderRadius: BorderRadius.all(Radius.circular(17.sp)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Colors.black26),
                      // Set focused border color to white
                      borderRadius: BorderRadius.all(Radius.circular(17.sp)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:  BorderSide(color: Theme.of(context).brightness == Brightness.light
                          ? Colors.white
                          : Colors.black26),
                      // Set enabled border color to white
                      borderRadius: BorderRadius.all(Radius.circular(17.sp)),
                    ),
                    prefixIcon:widget.prefixIcon,
                    suffixIcon: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Visibility(
                          visible: widget.isImage,
                          child: InkWell(
                            onTap: widget.uploadMedicalId,
                            child: AppSVG(assetName: "upload"),
                          ),
                        ),
                        Visibility(
                          visible: widget.isPassword,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                widget.obscureText = !widget.obscureText;
                              });
                            },
                            child: Icon(
                              widget.obscureText ? Icons.visibility_off : Icons.visibility,
                              color: Theme.of(context).brightness == Brightness.light ?Colors.black:Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    hintText: widget.hint,

                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}
