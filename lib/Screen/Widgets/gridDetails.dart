import 'package:assignment/Data/notifier.dart';
import 'package:assignment/Screen/Widgets/gridInfo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GridDetails extends StatelessWidget {
  const GridDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    return Container(
      height: 220,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: theme
            ? LinearGradient(
                colors: [Colors.black, Colors.blue[900]!, Colors.black],
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
              )
            : LinearGradient(
                colors: [Colors.white, Colors.blue[200]!, Colors.white],
                // begin: Alignment.topLeft,
                // end: Alignment.bottomRight,
              ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: theme ? Colors.white24 : Colors.grey,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: GridView.count(
        physics: NeverScrollableScrollPhysics(),
        crossAxisCount: 2,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        childAspectRatio: 2,
        children: [
          info(
            heading: "SIGNORIA",
            value: "0.00",
            iconData: Icons.trending_up,
            iconColor: theme ? Colors.green[300]! : Colors.green[700]!,
          ),
          info(
            heading: "NIFTY BANK",
            value: "52,323.30",
            iconData: Icons.account_balance,
            iconColor: theme ? Colors.blue[200]! : Colors.blue[900]!,
          ),
          info(
            heading: "NIFTY FIN SERVICE",
            value: "25,255.75",
            iconData: Icons.bar_chart,
            iconColor: theme ? Colors.blue[200]! : Colors.blue[900]!,
          ),
          info(
            heading: "RELCHEMQ",
            value: "162.73",
            iconData: Icons.trending_down,
            iconColor: theme ? Colors.red[300]! : Colors.red[800]!,
          ),
        ],
      ),
    );
  }
}