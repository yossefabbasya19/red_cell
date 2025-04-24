import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';
import 'package:red_cell/core/constant.dart';

class RequestDetailsDropDown extends StatefulWidget {
  final void Function(String?)? onChange;
  final String selected;
  final List<String> items;
  final String label;
  const RequestDetailsDropDown({super.key, this.onChange, required this.selected, required this.items, required this.label});

  @override
  State<RequestDetailsDropDown> createState() => _RequestDetailsDropDownState();
}

class _RequestDetailsDropDownState extends State<RequestDetailsDropDown> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: Theme.of(context).textTheme.titleSmall),
        SizedBox(height: 5),
        Container(
          padding: EdgeInsets.all(8),
          height: 41,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: ColorsManeger.redWithOpacity5, width: 2),
          ),
          child: Row(
            children: [
              Text(widget.selected),
              Spacer(),
              DropdownButton(
                underline: SizedBox(),
                items:
                    widget.items.map((e) {
                      return DropdownMenuItem(child: Text(e), value: e);
                    }).toList(),
                onChanged: widget.onChange,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
