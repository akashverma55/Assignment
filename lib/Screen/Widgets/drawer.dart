
import 'package:assignment/Data/notifier.dart';
import 'package:assignment/Screen/Widgets/detail.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    return Drawer(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: theme
              ? LinearGradient(
                  colors: [Colors.black, Colors.blue[900]!, Colors.black],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : LinearGradient(
                  colors: [Colors.white, Colors.blue[200]!, Colors.white],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100),
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                        "https://img.freepik.com/premium-photo/happy-man-ai-generated-portrait-user-profile_1119669-1.jpg?w=2000",
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Akash Kumar Verma",style:TextStyle(color: theme? Colors.white:Colors.black, fontSize: 18,fontWeight: FontWeight.w500)),
                    Text("akvakv150@gmail.com",style:TextStyle(color: theme? Colors.white:Colors.black, fontSize: 18,fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(
                color: theme ? Colors.white : Colors.black,
                thickness: 2,
                indent: 20,
                endIndent: 20,
              ),
              SizedBox(height: 20),
              DrawerDetail(
                theme: theme,
                icondata: Icons.payment,
                text: "Payment",
              ),
              DrawerDetail(
                theme: theme,
                icondata: Icons.terminal,
                text: "Promo",
              ),
              DrawerDetail(
                theme: theme,
                icondata: Icons.notifications,
                text: "Notification",
              ),
              DrawerDetail(theme: theme, icondata: Icons.help, text: "Help"),
              DrawerDetail(
                theme: theme,
                icondata: Icons.info_outline,
                text: "About Us",
              ),
              DrawerDetail(
                theme: theme,
                icondata: Icons.star_border,
                text: "Rate Us",
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40),
                  ),
                  backgroundColor: theme ? Colors.blue[400] : Colors.blue[900],
                  minimumSize: Size(60, 50),
                  maximumSize: Size(160, 50),
                  foregroundColor: Colors.white,
                  side: BorderSide(width: 2, color: Colors.white),
                ),
                child: Row(
                  children: [
                    Icon(Icons.lock, size: 26),
                    SizedBox(width: 10),
                    Text("Logout", style: TextStyle(fontSize: 22)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}