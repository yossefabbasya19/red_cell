import 'package:flutter/material.dart';
import 'package:red_cell/core/colors_maneger/colors_maneger.dart';

class RequestDetailsDatePicker extends StatefulWidget {
  final void Function(DateTime?) onSelectDate;
  final String selectDate;
  const RequestDetailsDatePicker({super.key, required this.onSelectDate, required this.selectDate});

  @override
  State<RequestDetailsDatePicker> createState() =>
      _RequestDetailsDatePickerState();
}

class _RequestDetailsDatePickerState extends State<RequestDetailsDatePicker> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Valid Time", style: Theme.of(context).textTheme.titleSmall),

        SizedBox(
          height: 41,
          width: double.infinity,
          child: OutlinedButton(
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: ColorsManeger.redWithOpacity5, width: 2),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            onPressed: () async {
              await showDatePicker(
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime(DateTime.now().year+1)
              ).then(widget.onSelectDate);
            },
            child: Text(
              widget.selectDate,
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ),
        ),
      ],
    );
  }
}
