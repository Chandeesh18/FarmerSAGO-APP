import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Product {
  final String name;
  final String price;
  final String img;

  const Product({required this.name, required this.price, required this.img});
  static Product fromSnapshot(DocumentSnapshot snap) {
    Product goods = Product(
        name: snap['goods_name'], price: snap['goods_price'], img: snap['img']);
    return goods;
  }
}
