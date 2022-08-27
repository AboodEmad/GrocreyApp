import 'package:flutter/material.dart';
import 'package:grocery_app/screens/order/order_details_screen.dart';

import '../../model/order.dart';
import 'order_item.dart';

class OrderTab extends StatelessWidget {
  OrderTab({Key? key, required this.list}) : super(key: key);

  final List<Order> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: list.length,
      itemBuilder: (context, index) {
        var order = list.elementAt(index);
        return OrderItem(
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderDetailsScreen(
                id: order.id.toString(),
              ),
            ),
          ),
          id: order.id.toString(),
          date: order.date,
          status: order.status,
        );
      },
    );
  }
}
