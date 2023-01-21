import 'package:farmers_sago/product1.dart';
import 'package:farmers_sago/product2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Catlog extends StatelessWidget {
  final productController = Get.put(ProductController());
  Catlog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
          child: ListView.builder(
              itemCount: productController.Products.length,
              itemBuilder: (BuildContext context, int index) {
                return CatalogProductCard(index: index);
              })),
    );
  }
}

class CatalogProductCard extends StatelessWidget {
  final ProductController productController = Get.find();
  final int index = 0;
  CatalogProductCard({Key? key, required int index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              productController.Products[index].img,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Text(
              productController.Products[index].name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          Expanded(
            child: Text('${productController.Products[index].price}'),
          ),
          Icon(
            Icons.add_circle,
          ),
        ],
      ),
    );
  }
}
