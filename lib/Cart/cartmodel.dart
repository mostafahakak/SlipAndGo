import 'package:flutter/foundation.dart';

class CartModel {
  final String name,
      description,
      category,
      imageUrl,
      productId,
      brand;
  final String date;

  int quantity,
      //for most best seller
      sellCount;
  int price;
  bool offer;

  CartModel(
      {this.productId,
      @required this.name,
      @required this.imageUrl,
      @required this.description,
      @required this.brand,
      @required this.category,
      @required this.date,
      @required this.quantity,
      @required this.price,
      @required this.sellCount,
      @required this.offer,
      });
}
