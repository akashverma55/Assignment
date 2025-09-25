import 'package:flutter/material.dart';

class IconImage extends StatefulWidget {
  const IconImage({super.key, required this.name});
  final String name;

  @override
  State<IconImage> createState() => _IconImageState();
}

class _IconImageState extends State<IconImage> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print("${widget.name} is clicked!!");
      },
      child: Image.asset(
        'assets/images/${widget.name}.png',
        height: 20,
        width: 20,
      ),
    );
  }
}