import 'package:farmers_sago/Products.dart';
import 'package:farmers_sago/productslist.dart';
import 'package:get/get.dart';
import 'package:farmers_sago/product1.dart';

class ProductController extends GetxController {
  final Products = <Product>[].obs;
  @override
  void onInit() {
    Products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
  }
}
