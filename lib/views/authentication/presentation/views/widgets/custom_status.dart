import 'package:flutter/material.dart';

class CustomStatus extends StatelessWidget {
  final String titleOne;
  final String titleTwo;
  const CustomStatus({super.key, required this.titleOne, required this.titleTwo});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Text(
          titleOne,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Spacer(),
        Text(
          titleTwo,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
