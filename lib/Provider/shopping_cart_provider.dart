import 'package:flutter/material.dart';

class ShoppingCartProvider with ChangeNotifier {
  List<String> shoppingCartList = ['Shirt', 'Shoes', 'Pants'];
  int get count => shoppingCartList.length;
  List<String> get cart => shoppingCartList;

  void addItem(String item) {
    shoppingCartList.add(item);
    notifyListeners();
  }
}
