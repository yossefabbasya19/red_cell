import 'package:flutter/material.dart';

class RequestDetailsTextField extends StatelessWidget {
  final String label;
  final TextInputType keyboardType;
  final void Function(String?)? onSave;
  final String? Function(String?)? validation;
  const RequestDetailsTextField({super.key, required this.label, required this.keyboardType, this.onSave, this.validation});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      Text(
        label,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      SizedBox(height: 5),
      SizedBox(
        height: 41,
        child: TextFormField(
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
          ),
          onSaved: onSave,
          keyboardType: keyboardType,
          validator: validation,
        ),
      ),
    ],);
  }
}
