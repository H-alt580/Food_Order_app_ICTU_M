import 'package:flutter/material.dart';
import 'package:food_delivery_app/Screens/home/widget/food_list.dart';
import 'package:food_delivery_app/Screens/home/widget/food_list_view.dart';
import 'package:food_delivery_app/Screens/home/widget/restaurant_info.dart';
import 'package:food_delivery_app/constants/colors.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/widgets/custom_app_bar.dart';
import 'package:food_delivery_app/widgets/shopping_bag.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var selected = 0;
  final pageController = PageController();
  final restaurant = Restaurant.generateRestaurant();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(
            leftIcon: Icons.arrow_back,
            rightIcon: Icons.search,
          ),
          RestaurantInfo(),
          FoodList(
            selected: selected,
            restaurant: restaurant,
            callback: (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
          ),
          Expanded(
              child: FoodListView(
            selected: selected,
            callback: (int index) {
              setState(() {
                selected = index;
              });
            },
            pageController: pageController,
            restaurant: restaurant,
          )),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            height: 60,
            child: SmoothPageIndicator(
              controller: pageController,
              count: restaurant.menu.length,
              effect: CustomizableEffect(
                dotDecoration: DotDecoration(
                  width: 8,
                  height: 8,
                  color: Colors.grey.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                activeDotDecoration: DotDecoration(
                  width: 10,
                  height: 10,
                  color: kBackground,
                  borderRadius: BorderRadius.circular(10),
                  dotBorder: DotBorder(
                    color: kPrimaryColor,
                    padding: 2,
                    width: 2,
                  ),
                ),
              ),
              onDotClicked: (index) => pageController.jumpToPage(index),
            ),
          )
        ],
      ),
      floatingActionButton: Container(
            width: 100,
            height: 56,
            child: RawMaterialButton(
              onPressed: () {},
              fillColor: kPrimaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              elevation: 2,
              child: shopping_bag(context),
            )
            )
    );
  }
}
