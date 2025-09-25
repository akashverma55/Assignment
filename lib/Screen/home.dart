import 'package:assignment/Data/notifier.dart';
import 'package:assignment/Screen/Widgets/iconImage.dart';
import 'package:assignment/Screen/Widgets/cardDetails.dart';
import 'package:assignment/Screen/Widgets/drawer.dart';
import 'package:assignment/Screen/Widgets/gridDetails.dart';
import 'package:flutter/material.dart';
import '../Data/data.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    final Data data = Data();
    List<Map<String, dynamic>> ListOfOrders = data.ListOfOrders;
    return Scaffold(
      key: scaffoldKey,
      drawer: DrawerPage(),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme ? Colors.blue[900] : Colors.blue[400],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: theme ? Colors.white24 : Colors.grey,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                right: 20,
                left: 20,
                bottom: 20,
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => scaffoldKey.currentState!.openDrawer(),
                    child: const CircleAvatar(
                      radius: 25,
                      backgroundImage: NetworkImage(
                        "https://img.freepik.com/premium-photo/happy-man-ai-generated-portrait-user-profile_1119669-1.jpg?w=2000",
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Akash",
                    style: TextStyle(
                      fontFamily: 'play2',
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Spacer(),
                  IconImage(name: "search"),
                  const SizedBox(width: 10),
                  IconImage(name: "filter"),
                  PopupMenuButton(
                    iconColor: Colors.black,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: "MARKET WATCH",
                        child: Text("MARKET WATCH"),
                      ),
                      PopupMenuItem(
                        value: "EXCHANGE FILES",
                        child: Text("EXCHANGE FILES"),
                      ),
                      PopupMenuItem(
                        value: "PORTFOLIO",
                        child: Text("PORTFOLIO"),
                      ),
                      PopupMenuItem(value: "FUNDS", child: Text("FUNDS")),
                      PopupMenuItem(
                        value: "LOG OUT",
                        child: Text(
                          "LOG OUT",
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                    ],
                    onSelected: (String newvalue) {
                      print("$newvalue Clicked!!");
                    },
                  ),
                ],
              ),
            ),
          ),
          GridDetails(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Open Orders",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
                Icon(
                  Icons.download,
                  size: 30,
                  color: theme ? Colors.blue[100] : Colors.blue,
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CardDetailsList(ListOfOrders: ListOfOrders),
            ),
          ),
        ],
      ),
    );
  }
}













