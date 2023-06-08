  import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/food.dart';
import '../provider/provider.dart';

Row shopping_bag(BuildContext context) {
  final shoppingCardProvider = Provider.of<ShoppingCardProvider>(context);

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Icon(
        Icons.shopping_bag_outlined,
        color: Colors.black,
        size: 30,
      ),
      Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Text(
          shoppingCardProvider.quantity.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ],
  );
}