import 'package:assignment/notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class mySettingPage extends StatefulWidget {
  const mySettingPage({super.key});

  @override
  State<mySettingPage> createState() => _mySettingPageState();
}

class _mySettingPageState extends State<mySettingPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Setting",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(thickness: 2),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Dark Theme",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                Transform.scale(
                  scale: 0.6,
                  child: ToggleButtons(
                    isSelected: [!theme, theme],
                    borderWidth: 3,
                    fillColor: Colors.blue,
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(25),
                    selectedBorderColor: theme? Colors.white:Colors.black,
                    borderColor: theme? Colors.white:Colors.black,
                    onPressed:(index) => Provider.of<themeNotifier>(context,listen:false).changeTheme(),
                    children: [
                      Icon(Icons.light_mode, color: Colors.black),
                      Icon(Icons.dark_mode, color: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
