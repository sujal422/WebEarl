import 'package:flutter/material.dart';
import 'package:webearl/view/model/product_model.dart';


class HomeViewModel extends ChangeNotifier {
  final List<ProductModel> exclusiveOffers = [
    ProductModel(
      name: "Organic Bananas",
      image: "assets/images/Exclusive offer 1.png",
      price: "\$4.99",
      quantity: "7pcs",
    ),
    ProductModel(
      name: "Red Apple",
      image: "assets/images/Exclusive offer 2.png",
      price: "\$4.99",
      quantity: "1kg",
    ),
  ];

  final List<ProductModel> bestSelling = [
    ProductModel(
      name: "Bell Pepper Red",
      image: "assets/images/Best Selling.png",
      price: "\$4.99",
      quantity: "1kg",
    ),
    ProductModel(
      name: "Beef Bone",
      image: "assets/images/Best Selling 1.png",
      price: "\$4.99",
      quantity: "1kg",
    ),
  ];

  final List<ProductModel> groceries = [
    ProductModel(
      name: "Pulses",
      image: "assets/images/Groceries3.png",
      price: "\$4.99",
      quantity: "1kg",
    ),
    ProductModel(
      name: "Rice",
      image: "assets/images/Groceries4.png",
      price: "\$4.99",
      quantity: "1kg",
    ),
  ];
}
