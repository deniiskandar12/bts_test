import 'package:bts_test/configs/themes/app_colors.dart';
import 'package:bts_test/configs/themes/app_text_styles.dart';
import 'package:bts_test/constants/dimen_consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAppTextField extends StatefulWidget {
  const CustomAppTextField({
    Key? key,
    this.controller,
    this.errorText = "",
    this.hint = "",
    this.isPassword = false,
    this.isDate = false,
    this.onChanged,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.minLines = 1,
    this.validator,
    this.inputFormatters,
    this.isEnabled = true,
    this.icon,
  }) : super(key: key);

  final TextEditingController? controller;
  final String hint;
  final String errorText;
  final bool isPassword;
  final bool isDate;
  final bool isEnabled;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final int? maxLines;
  final int minLines;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final String? icon;

  @override
  State<CustomAppTextField> createState() => _CustomAppTextFieldState();
}

class _CustomAppTextFieldState extends State<CustomAppTextField> {
  late FocusNode focusNode;
  String valueText = '';
  bool isHidePassword = true;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
    focusNode.addListener(_onFocusChange);
  }

  void togglevisibility() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      isFocus = focusNode.hasFocus;
    });
  }

  var isFocus = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: widget.controller,
      maxLines: widget.maxLines,
      minLines: widget.minLines,
      onChanged: widget.onChanged,
      enabled: widget.isEnabled,
      style: AppTextStyles.f12BlackW500,
      validator: widget.validator,
      enableSuggestions: !widget.isPassword,
      autocorrect: !widget.isPassword,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        errorText: widget.errorText.isNotEmpty ? widget.errorText : null,
        errorStyle: AppTextStyles.f12RedW400,
        errorMaxLines: DimenConsts.int2,
        hintText: widget.hint,
        hintStyle: AppTextStyles.f12GreyW400,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenConsts.pixel15),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: DimenConsts.pixel1,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenConsts.pixel15),
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: DimenConsts.pixel1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenConsts.pixel15),
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: DimenConsts.pixel1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenConsts.pixel15),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: DimenConsts.pixel1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(DimenConsts.pixel15),
          borderSide: const BorderSide(
            color: AppColors.redColor,
            width: DimenConsts.pixel1,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: DimenConsts.pixel20.w,
          vertical: DimenConsts.pixel16.h,
        ),
        suffixIconConstraints: BoxConstraints(
          minHeight: DimenConsts.pixel24.h,
          minWidth: DimenConsts.pixel24.w,
        ),
        // isDense: true,
        suffixIcon: widget.isPassword
            ? Padding(
                padding: EdgeInsets.only(right: DimenConsts.pixel16.w),
                child: GestureDetector(
                  onTap: valueText.isEmpty || widget.errorText.isEmpty
                      ? () {
                          togglevisibility();
                        }
                      : null,
                  child: valueText.isEmpty || widget.errorText.isEmpty
                      ? Icon(
                          isHidePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.greyColor)
                      : const Icon(
                          Icons.error,
                          color: AppColors.redColor,
                        ),
                ),
              )
            : widget.icon != null
                ? Padding(
                    padding: EdgeInsets.only(right: DimenConsts.pixel16.w),
                    child: SvgPicture.asset(widget.icon!),
                  )
                : const SizedBox(),
      ),
      obscureText: widget.isPassword && isHidePassword,
      keyboardType: widget.inputType,
      textInputAction: widget.inputAction,
    );
  }
}
