import 'package:assignment/Data/notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class info extends StatelessWidget {
  const info({
    required this.heading,
    required this.value,
    required this.iconColor,
    required this.iconData,
  });

  final String heading;
  final String value;
  final Color iconColor;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: theme ? Colors.blue[800] : Colors.lightBlue[200],
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: Colors.white),
      ),
      child: Row(
        children: [
          Icon(iconData, color: iconColor, size: 28),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  heading,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: theme ? Colors.white : Colors.black,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 1,
                ),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: iconColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
