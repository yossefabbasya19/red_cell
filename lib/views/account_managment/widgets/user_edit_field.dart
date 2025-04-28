import 'package:flutter/material.dart';
import 'package:red_cell/core/DM/user_info_DM.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class UserEditField extends StatefulWidget {
  const UserEditField({
    super.key,
    required this.userInfoDm,
    required this.fieldName,
    required this.initialValue,
    this.validator,
    this.onSave,
    this.isPassword = false, this.onChange,
  });

  final UserInfoDm userInfoDm;
  final bool isPassword;
  final String fieldName;
  final String initialValue;
  final String? Function(String?)? validator;
  final void Function(String?)? onSave;
  final void Function(String?)? onChange;

  @override
  State<UserEditField> createState() => _UserEditFieldState();
}

class _UserEditFieldState extends State<UserEditField> {
  bool isObscureText = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(
            widget.fieldName,
            style: TextStyle(
              color: ColorsManeger.gray,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: TextFormField(
            onChanged: widget.onChange,
            obscureText: isObscureText,
            initialValue: widget.initialValue,
            validator: widget.validator,
            onSaved: widget.onSave,
            decoration: InputDecoration(
              suffixIconConstraints: !widget.isPassword ? BoxConstraints(
                  maxHeight: 0, maxWidth: 0):BoxConstraints(maxWidth: 40,maxHeight: 40),
              suffixIcon:
              widget.isPassword
                  ? IconButton(
                onPressed: () {
                  isObscureText = !isObscureText;
                  setState(() {});
                },
                icon:
                isObscureText
                    ? Icon(
                  Icons.visibility,
                  color: ColorsManeger.black,
                )
                    : Icon(
                  Icons.visibility_off,
                  color: ColorsManeger.black,
                ),
              )
                  : Padding(padding: EdgeInsets.zero),
              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
            ),
          ),
        ),
      ],
    );
  }
}
