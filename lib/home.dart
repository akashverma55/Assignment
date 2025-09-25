import 'package:assignment/notifier.dart';
import 'package:flutter/material.dart';
import 'data.dart';
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
  List<Map<String,dynamic>> ListOfOrders = data.ListOfOrders;
    return Scaffold(
      key: scaffoldKey,
      drawer: Drawer(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: theme? Colors.black:Colors.white,
        ),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color:theme? Colors.blue[900]:Colors.blue[400],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(color: theme?Colors.white24:Colors.grey, blurRadius: 10, spreadRadius: 5,offset: Offset(0, 4)),
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
                      backgroundImage: NetworkImage("https://img.freepik.com/premium-photo/happy-man-ai-generated-portrait-user-profile_1119669-1.jpg?w=2000"),
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
                  const SizedBox(width: 10),
                  IconImage(name: "menu"),
                ],
              ),
            ),
          ),
          GridDetails(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Open Orders",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w500),
                ),
                Icon(Icons.download,size: 30, color: theme? Colors.blue[100]:Colors.blue,),
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

class IconImage extends StatelessWidget {
  const IconImage({
    super.key,required this.name
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(name=="menu"){
          PopupMenuButton(
            itemBuilder: (context)=> [
              PopupMenuItem(
                child: Text("Market Watch"),
                value: 
              )
            ],
          );
        }
        print("$name is clicked!!");
      },
      child: Image.asset('assets/images/$name.png', height: 20, width: 20),
    );
  }
}

class CardDetailsList extends StatelessWidget {
  const CardDetailsList({
    super.key,
    required this.ListOfOrders,
  });

  final List<Map<String, dynamic>> ListOfOrders;

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    return ListView.builder(
      shrinkWrap: true,
      itemCount: ListOfOrders.length,
      itemBuilder: (context, index) {
        return Card(
          elevation: 5,
          shadowColor: theme? Colors.grey[200]: Colors.grey,
          margin: EdgeInsets.only(bottom: 20,right: 20, left:20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color:theme? Colors.blue[900]: Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20)
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(ListOfOrders[index]["time"],style: TextStyle(fontSize: 16)),
                      Icon(Icons.more_vert,size:30)
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CircularProgressIndicator(
                        value: double.parse(ListOfOrders[index]['qty_executed'])/double.parse(ListOfOrders[index]['qty_total']),
                        backgroundColor:theme? Colors.white:Colors.grey[700],
                        color:Colors.blue,
                        strokeWidth: 7,
                        strokeCap: StrokeCap.round,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(ListOfOrders[index]['ticker'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          SizedBox(height: 5),
                          Text("${ListOfOrders[index]['qty_executed']}/${ListOfOrders[index]['qty_total']}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),)
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("${ListOfOrders[index]['side']} ${ListOfOrders[index]['ticker']} Stock")));
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          elevation: 5,
                          backgroundColor: ListOfOrders[index]['side']=="Buy"? Colors.green: Colors.red,
                          minimumSize: Size(100, 50)
                        ),
                        child: Center(child: Text(ListOfOrders[index]['side'],style: TextStyle(color: Colors.white,fontSize: 16, fontWeight: FontWeight.bold),)),
                      )
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color:theme? Colors.black: Colors.white
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Details(title: "Client",value: ListOfOrders[index]["client"],),
                        Details(title: "Product",value: ListOfOrders[index]["product"],),
                        Details(title: "Price",value: ListOfOrders[index]["price"],),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.title,
    required this.value
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        SizedBox(height: 2,),
        Text(value),
      ],
    );
  }
}

class GridDetails extends StatelessWidget {
  const GridDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<themeNotifier>(context).isDark;
    return Container(
      height: 220,
      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
      padding: EdgeInsets.symmetric(horizontal:20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: theme? LinearGradient(
          colors: [Colors.black, Colors.blue[900]!, Colors.black],
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        ):
        LinearGradient(
          colors: [Colors.white, Colors.blue[200]!, Colors.white],
          // begin: Alignment.topLeft,
          // end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            spreadRadius: 5,
            color: theme?Colors.white24:Colors.grey,
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
          _info(
            heading: "SIGNORIA",
            value: "0.00",
            iconData: Icons.trending_up,
            iconColor: theme?Colors.green[300]!: Colors.green[700]!,
          ),
          _info(
            heading: "NIFTY BANK",
            value: "52,323.30",
            iconData: Icons.account_balance,
            iconColor: theme? Colors.blue[200]!:Colors.blue[900]!,
          ),
          _info(
            heading: "NIFTY FIN SERVICE",
            value: "25,255.75",
            iconData: Icons.bar_chart,
            iconColor: theme? Colors.blue[200]!:Colors.blue[900]!,
          ),
          _info(
            heading: "RELCHEMQ",
            value: "162.73",
            iconData: Icons.trending_down,
            iconColor:theme? Colors.red[300]!: Colors.red[800]!,
          ),
        ],
      ),
    );
  }
}

class _info extends StatelessWidget {
  const _info({
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
        color: theme? Colors.blue[800]: Colors.lightBlue[200],
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
                    color: theme? Colors.white: Colors.black,
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
