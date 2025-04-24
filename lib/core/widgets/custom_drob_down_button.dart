import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';

class CustomDropDownButton extends StatefulWidget {
  final void Function(String?)? onSelect;
  final String label;
  final List<String> Items;
  const CustomDropDownButton({super.key, this.onSelect, required this.label, required this.Items});

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  late String dropdownValue;
@override
  void initState() {
  dropdownValue= widget.Items.first;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: DropdownMenu(
          onSelected: widget.onSelect,
          label: Text(widget.label),
          textStyle: TextStyle(fontWeight: FontWeight.w700),
          initialSelection: dropdownValue,
          menuHeight: 400,
          width: double.infinity,
          dropdownMenuEntries: widget.Items.map((String value) {
            return DropdownMenuEntry<String>(value: value, label: value);
          }).toList()

        ),
      ),
    );
  }
}
