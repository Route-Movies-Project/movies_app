import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';

class DefaultTextFormField extends StatefulWidget {
  const DefaultTextFormField({
    this.textEditingController,
    this.isPassword = false,
    this.validator,
    required this.hintText,
    this.prefixImageName,
    this.textInputType,
    this.onChanged,
    this.maxLines = 1,
    this.isSearch = false,
    this.textCapitalization = TextCapitalization.none,
    this.textInputFormatter,
    super.key,
  });
  final TextEditingController? textEditingController;
  final bool isPassword;
  final String? Function(String?)? validator;
  final String hintText;
  final String? prefixImageName;
  final TextInputType? textInputType;
  final void Function(String)? onChanged;
  final int? maxLines;
  final bool isSearch;
  final TextCapitalization textCapitalization;
  final TextInputFormatter? textInputFormatter;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObscure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      inputFormatters: widget.textInputFormatter == null
          ?[
       
      ]: [
              widget.textInputFormatter!,
            ],
      textCapitalization: widget.textCapitalization,
      textInputAction: TextInputAction.done,
      controller: widget.textEditingController,
      onChanged: widget.onChanged,
      cursorColor: ThemeColors.white,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: widget.textInputType,
      style: HelperFunction.textTheme(context)
          .bodyMedium!
          .copyWith(fontSize: 20.sp),
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        filled: true,
        fillColor: ThemeColors.grey,
        prefixIcon: widget.prefixImageName != null
            ? SvgPicture.asset(
                'assets/icons/${widget.prefixImageName}.svg',
                fit: BoxFit.scaleDown,
              )
            : null,
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isObscure = !isObscure;
                  });
                },
                icon: Icon(
                  isObscure ? Icons.visibility_off : Icons.visibility,
                  color: ThemeColors.white,
                ),
              )
            : null,
        hintText: widget.hintText,
        hintStyle: HelperFunction.textTheme(context)
            .bodyMedium!
            .copyWith(fontSize: 20.sp),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide.none,
        ),
      ),
      validator: widget.validator,
      obscureText: isObscure,
    );
  }
}
