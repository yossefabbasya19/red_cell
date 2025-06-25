import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validation;
  final void Function(String)? onFieldSubmitted;
  final TextInputType? myKeyboardType;
  final TextEditingController? controller;
  final Widget? prefixIcon;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.myKeyboardType,
    this.onSaved,
    required this.isPassword,
    this.validation, this.onFieldSubmitted,  this.controller, this.prefixIcon,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 18),
        Text(widget.hintText, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 8),
        TextFormField(
          controller: widget.controller,
          onFieldSubmitted:widget.onFieldSubmitted ,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: ColorsManeger.black,
            fontSize: 16,
          ),
          keyboardType: widget.myKeyboardType,
          validator: widget.validation,
          onSaved: widget.onSaved,
          obscureText: isObscureText,
          decoration: InputDecoration(
            prefixIcon:widget.prefixIcon ,
            hintText: widget.hintText,
            suffixIcon:
                widget.isPassword
                    ? IconButton(
                      onPressed: () {
                        isObscureText = !isObscureText;
                        setState(() {});
                      },
                      icon:
                          isObscureText
                              ? Icon(Icons.visibility ,color: ColorsManeger.black,)
                              : Icon(Icons.visibility_off,color: ColorsManeger.black,),
                    )
                    : SizedBox(),
          ),
        ),
      ],
    );
  }
}
