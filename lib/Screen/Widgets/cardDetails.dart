import 'package:assignment/Data/notifier.dart';
import 'package:assignment/Screen/Widgets/details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardDetailsList extends StatelessWidget {
  const CardDetailsList({super.key, required this.ListOfOrders});

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
          shadowColor: theme ? Colors.grey[200] : Colors.grey,
          margin: EdgeInsets.only(bottom: 20, right: 20, left: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(20),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: theme ? Colors.blue[900] : Colors.blue.withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        ListOfOrders[index]["time"],
                        style: TextStyle(fontSize: 16),
                      ),
                      Icon(Icons.more_vert, size: 30),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      CircularProgressIndicator(
                        value:
                            double.parse(ListOfOrders[index]['qty_executed']) /
                            double.parse(ListOfOrders[index]['qty_total']),
                        backgroundColor: theme
                            ? Colors.white
                            : Colors.grey[700],
                        color: Colors.blue,
                        strokeWidth: 7,
                        strokeCap: StrokeCap.round,
                        strokeAlign: BorderSide.strokeAlignCenter,
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ListOfOrders[index]['ticker'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "${ListOfOrders[index]['qty_executed']}/${ListOfOrders[index]['qty_total']}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "${ListOfOrders[index]['side']} ${ListOfOrders[index]['ticker']} Stock",
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          elevation: 5,
                          backgroundColor: ListOfOrders[index]['side'] == "Buy"
                              ? Colors.green
                              : Colors.red,
                          minimumSize: Size(100, 50),
                        ),
                        child: Center(
                          child: Text(
                            ListOfOrders[index]['side'],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: theme ? Colors.black : Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Details(
                          title: "Client",
                          value: ListOfOrders[index]["client"],
                        ),
                        Details(
                          title: "Product",
                          value: ListOfOrders[index]["product"],
                        ),
                        Details(
                          title: "Price",
                          value: ListOfOrders[index]["price"],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}