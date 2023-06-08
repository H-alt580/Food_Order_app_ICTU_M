import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_delivery_app/Screens/home/home.dart';
import 'package:food_delivery_app/provider/provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
     return ChangeNotifierProvider(
      create: (_) => ShoppingCardProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Food Delivery App',
        home: HomePage(),
      ),
    );
  }
}
