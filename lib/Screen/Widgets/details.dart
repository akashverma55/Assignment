import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  const Details({super.key, required this.title, required this.value});

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [Text(title), SizedBox(height: 2), Text(value)],
    );
  }
}