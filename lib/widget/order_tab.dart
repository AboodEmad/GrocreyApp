import 'package:flutter/material.dart';

import '../model/order.dart';
import 'order_item.dart';

class OrderTab extends StatelessWidget {
   OrderTab({Key? key}) : super(key: key);

  List<Order> list = [
    Order(id: "2324252627", status: "Confirmed", date: "25 Nov"),
    Order(id: "2324252627", status: "Processing", date: "25 Nov"),
    Order(id: "2324252627", status: "Shipped", date: "25 Nov"),
    Order(id: "2324252627", status: "Delivery", date: "25 Nov"),
    Order(id: "2324252627", status: "Cancel", date: "25 Nov"),
    Order(id: "2324252627", status: "Confirmed", date: "25 Nov"),
    Order(id: "2324252627", status: "Processing", date: "25 Nov"),
    Order(id: "2324252627", status: "Shipped", date: "25 Nov"),
    Order(id: "2324252627", status: "Delivery", date: "25 Nov"),
    Order(id: "2324252627", status: "Cancel", date: "25 Nov"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: list.length,
      itemBuilder: (context, index) {
        var order = list.elementAt(index);
        return OrderItem(
          id: order.id,
          date: order.date,
          status: order.status,
        );
      },
    );
  }
}
