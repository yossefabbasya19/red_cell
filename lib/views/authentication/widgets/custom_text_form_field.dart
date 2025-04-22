import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validation;
  final TextInputType? myKeyboardType;

  const CustomTextFormField({
    super.key,
    required this.hintText,
    this.myKeyboardType,
    this.onSaved,
    required this.isPassword,
    this.validation,
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
