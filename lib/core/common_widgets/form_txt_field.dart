import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/app_fonts.dart' show AppFonts;
import '../theme/color_schemes.dart';

class CommonFormTextField extends StatefulWidget {
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
  final Widget? suffixIcon;

  const CommonFormTextField({
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
    this.suffixIcon,
  }) : super(key: key);

  @override
  State<CommonFormTextField> createState() => _CommonFormTextFieldState();
}

class _CommonFormTextFieldState extends State<CommonFormTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isPassword;
  }

  @override
  void didUpdateWidget(covariant CommonFormTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.isPassword != widget.isPassword) {
      _obscureText = widget.isPassword;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double heightOfTextField = 55.h;
    final bool shouldObscure = widget.isPassword ? _obscureText : false;
    return TextFormField(
      obscureText: shouldObscure,
      onChanged: widget.onTextChange,
      textAlign: widget.centerText ?? false
          ? TextAlign.center
          : TextAlign.start,
      textCapitalization:
          widget.textCapitalizationParam ?? TextCapitalization.none,
      readOnly: widget.readOnlyParam ?? false,
      maxLength: widget.maxLengthParam,
      validator: widget.validatorFunction,
      buildCounter:
          (context, {required currentLength, required isFocused, maxLength}) =>
              null,
      keyboardType: widget.keyboardTypeParam,
      inputFormatters: widget.inputFormattersParm,
      controller: widget.controller,
      maxLines: widget.maxLines,
      style:
          widget.textStyle ??
          TextStyle(
            fontFamily: AppFonts.degular,
            fontWeight: FontWeight.w600,
            fontSize: 18.sp,
            height: 1.0,
            letterSpacing: 0,
            color: AppColorSchemes.blackColor,
          ),
      decoration: InputDecoration(
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColorSchemes.purpuleColor,
                ),
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.suffixIcon,
        labelText: widget.hintText,
        errorText: widget.errorEnabled ? widget.errorText : null,
        errorStyle:
            widget.errorTextStyle ??
            TextStyle(
              fontFamily: AppFonts.degular,
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              height: 1.3,
              letterSpacing: 0,
              color: AppColorSchemes.redColor,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: AppColorSchemes.whiteColor),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: AppColorSchemes.purpuleColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: AppColorSchemes.redColor),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(color: AppColorSchemes.redColor2),
        ),
        hintText: widget.hintText,
        hintStyle:
            widget.hintStyle ??
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
        constraints: BoxConstraints(
          maxHeight: heightOfTextField,
          minHeight: heightOfTextField,
        ),
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.only(left: 10.w, right: 10.w, top: 14.h, bottom: 14.h),
      ),
    );
  }
}
