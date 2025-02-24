import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies_app/core/Themes/colors.dart';

class DefaultTextFormField extends StatefulWidget {
  DefaultTextFormField({required this.controller,
  required this.hintText,
  required this.prefixIconImageName,
  required this.Validator,
  required this.isPassword,
  });
  TextEditingController controller;
  String hintText;
  String? prefixIconImageName;
  String? Function(String?)? Validator;
  bool isPassword = false;

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  late bool isObsecure = widget.isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
      
        hintText: widget.hintText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset('assets/icons/${widget.prefixIconImageName}.svg',//height: ,width: 16,
          fit: BoxFit.scaleDown,color: ThemeColors.white,),
          
        ),
        suffixIcon:widget.isPassword?
         IconButton(onPressed: (){
          isObsecure = !isObsecure;
          setState(() {
          });
         },
       icon: Icon(isObsecure?
        Icons.visibility_outlined:
        Icons.visibility_off_outlined
        ),
        )
       : null,

      ),
      obscureText:isObsecure,
      
     
    );
   
  }
}