import 'package:flutter/material.dart';

class ShoppingCardProvider extends ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;

  set quantity(int newQuantity) {
    _quantity = newQuantity;
    notifyListeners();
  }

  void increaseQuantity() {
    _quantity++;
    notifyListeners();
  }

  void decreaseQuantity() {
    if (_quantity > 0) {
      _quantity--;
      notifyListeners();
    }
  }
}