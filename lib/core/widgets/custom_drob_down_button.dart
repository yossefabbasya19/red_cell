import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';

class CustomDropDownButton extends StatefulWidget {
  final void Function(String?)? onSelect;
  const CustomDropDownButton({super.key, this.onSelect});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String dropdownValue = egyptGovernorates.first;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: DropdownMenu(
          onSelected: widget.onSelect,
          label: Text("Choose your country"),
          textStyle: TextStyle(fontWeight: FontWeight.w700),
          initialSelection: dropdownValue,
          menuHeight: 400,
          width: double.infinity,
          dropdownMenuEntries: egyptGovernorates.map((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList()

        ),
      ),
    );
  }
}
