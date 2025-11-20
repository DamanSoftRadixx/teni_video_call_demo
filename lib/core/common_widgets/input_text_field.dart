import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_fonts.dart' show AppFonts;
import '../theme/color_schemes.dart';

class CommonInputTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final bool errorEnabled;
  final String? errorText;
  final TextStyle? errorTextStyle;
  final int maxLines;
  final EdgeInsetsGeometry? contentPadding;
  final double? width;
  final double? height;
  final double borderRadius;
  final TextCapitalization? textCapitalizationParam;
  final bool? readOnlyParam;
  final int? maxLengthParam;
  final TextInputType? keyboardTypeParam;
  final List<TextInputFormatter>? inputFormattersParm;
  final bool? centerText;
  final Function(String)? onTextChange;
  final bool isPassword;
  final FormFieldValidator<String>? validatorFunction;

  const CommonInputTextField({
    Key? key,
    this.width,
    this.height,
    required this.controller,
    required this.hintText,
    this.hintStyle,
    this.textStyle,
    this.errorEnabled = false,
    this.errorText,
    this.errorTextStyle,
    this.maxLines = 1,
    this.contentPadding,
    required this.borderRadius,
    this.textCapitalizationParam,
    this.readOnlyParam,
    this.maxLengthParam,
    this.keyboardTypeParam,
    this.inputFormattersParm,
    this.centerText = false,
    this.onTextChange,
    this.isPassword = false,
    this.validatorFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width ?? double.infinity,
          height: height ?? 50.h,
          decoration: BoxDecoration(
            color: AppColorSchemes.whiteColor,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          padding: EdgeInsets.all(6.w),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: TextFormField(
              obscureText: isPassword,
              onChanged: onTextChange,
              textAlign: centerText ?? false
                  ? TextAlign.center
                  : TextAlign.start,
              textCapitalization:
                  textCapitalizationParam ?? TextCapitalization.none,
              readOnly: readOnlyParam ?? false,
              maxLength: maxLengthParam,
              validator: validatorFunction,
              buildCounter:
                  (
                    context, {
                    required currentLength,
                    required isFocused,
                    maxLength,
                  }) => null,

              keyboardType: keyboardTypeParam,
              inputFormatters: inputFormattersParm,
              controller: controller,
              maxLines: maxLines,
              style:
                  textStyle ??
                  TextStyle(
                    fontFamily: AppFonts.degular,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.sp,
                    height: 1.0,
                    letterSpacing: 0,
                    color: AppColorSchemes.blackColor,
                  ),

              decoration: InputDecoration(
                labelText: hintText,
                hintText: hintText,
                hintStyle:
                    hintStyle ??
                    TextStyle(
                      fontFamily: AppFonts.degular,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.sp,
                      height: 1.0,
                      letterSpacing: 0,
                      color: AppColorSchemes.blackColor,
                    ),
                border: InputBorder.none,
                isDense: true,
                contentPadding:
                    contentPadding ??
                    EdgeInsets.only(
                      left: 16.w,
                      right: 16.w,
                      top: 16.h,
                      bottom: 12.h,
                    ),
              ),
            ),
          ),
        ),
        if (errorEnabled &&
            errorText != null &&
            errorText!.isNotEmpty &&
            validatorFunction == null)
          Padding(
            padding: EdgeInsets.only(top: 4.h, left: 2.w),
            child: Text(
              errorText!,
              style:
                  errorTextStyle ??
                  TextStyle(
                    color: AppColorSchemes.redColor,
                    fontSize: 12.sp,
                    fontFamily: AppFonts.degular,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
      ],
    );
  }
}
