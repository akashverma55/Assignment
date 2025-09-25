import 'package:assignment/Screen/home.dart';
import 'package:assignment/Data/notifier.dart';
import 'package:assignment/Screen/settings.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(create: (context)=> themeNotifier(),child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;

    final ColorScheme colorSchemeLight = ColorScheme.fromSeed(
      seedColor: Colors.lightBlueAccent,
      brightness: Brightness.light,
    );
    final ColorScheme colorSchemeDark = ColorScheme.fromSeed(
      seedColor: Colors.lightBlueAccent,
      brightness: Brightness.dark,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: theme ? colorSchemeDark : colorSchemeLight,
        scaffoldBackgroundColor: theme ? Colors.black : Colors.white,
        splashColor: Colors.blueAccent.withOpacity(0.5),
      ),
      home: const MyMainPage(),
    );
  }
}

class MyMainPage extends StatefulWidget {
  const MyMainPage({super.key});

  @override
  State<MyMainPage> createState() => _MyMainPageState();
}

class _MyMainPageState extends State<MyMainPage> {
  int _navigationBarIndex = 0;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Widget> _screens = [
    const MyHomePage(),
    const Center(child: Text("Stock Page")),
    const mySettingPage(),
    const Center(child: Text("Profile Page")),
  ];

  final items = [
    Icon(Icons.home, size: 30, color: Colors.white),
    Icon(Icons.graphic_eq_sharp, size: 30, color: Colors.white),
    Icon(Icons.settings, size: 30, color: Colors.white),
    Icon(Icons.person, size: 30, color: Colors.white),
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    return Scaffold(
      key: scaffoldKey,
      
      extendBody: true,
      body: _screens[_navigationBarIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        index: _navigationBarIndex,
        items: items,
        color:theme? Colors.blue[900]!:Colors.blue[400]!,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: theme? Colors.blue[900]!:Colors.blue[400]!,
        onTap: (index) => setState(() => _navigationBarIndex = index),
      ),
    );
  }
}
