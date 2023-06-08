import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:food_delivery_app/constants/colors.dart';

import 'package:food_delivery_app/models/food.dart';
import 'package:provider/provider.dart';

import '../../../provider/provider.dart';

class FoodQuantity extends StatelessWidget {
  final Food? food;
  const FoodQuantity({
    Key? key,
    this.food,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
     final shoppingCardProvider = Provider.of<ShoppingCardProvider>(context);
    return Container(
        width: double.maxFinite,
        height: 40,
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-0.3, 0),
              child: Container(
                height: double.maxFinite,
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(children: [
                  SizedBox(
                    width: 15,
                  ),
                 
                  Text(
                    food!.price!.toString(),
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                   Text(
                    'fcfa',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
            Align(
              alignment: Alignment(0.1, 0),
              child: Container(
                height: double.maxFinite,
                width: 150,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(1), // Adjust button size
                        primary: kPrimaryColor, // Set button color to white
                      ),
                        onPressed: () {
                          shoppingCardProvider.decreaseQuantity();
                          },
                        child: Text(
                          '-',
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: Colors.white),
                      child: Text(
                        food!.quantity!.toString(),
                      ),
                    ),
                     SizedBox(
                      height: 50,
                      width: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(1), // Adjust button size
                        primary: kPrimaryColor, // Set button color to white
                      ),
                        onPressed: () { 
                          shoppingCardProvider.increaseQuantity();
                         },
                        child: Text(
                          '+',
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
