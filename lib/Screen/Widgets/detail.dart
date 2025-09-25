import 'package:flutter/material.dart';

class DrawerDetail extends StatelessWidget {
  const DrawerDetail({
    super.key,
    required this.theme,
    required this.icondata,
    required this.text,
  });

  final bool theme;
  final IconData icondata;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(
            icondata,
            color: theme ? Colors.blue[200] : Colors.blue[900],
            size: 26,
          ),
          SizedBox(width: 10),
          Text(
            text,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w500,
              color: theme ? Colors.blue[200] : Colors.blue[900],
            ),
          ),
        ],
      ),
    );
  }
}