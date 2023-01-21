import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_sago/Conformation.dart';
import 'package:farmers_sago/GoodsPage.dart';
import 'package:farmers_sago/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Catlog extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  //constructor Snippet Code
  String name, amount, price, description;
  int number;
  Catlog(
      {Key? key,
      required this.name,
      required this.amount,
      required this.price,
      required this.description,
      required this.number})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Conformation Page"),
          centerTitle: true,
          backgroundColor: Colors.purple,
        ),
        body: Stack(
          children: <Widget>[
            Center(
                child: Card(
                    //shape: RoundedRectangleBorder(
                    //borderRadius: BorderRadius.circular(30.0),
                    //),
                    // ignore: avoid_print
                    child: Container(
              height: 600,
              width: 450,
              padding: EdgeInsets.all(16),
              color: Colors.black12,
              child: Text(
                '\n' +
                    'Product Name:$name' +
                    '\n\nproduct Price:$price' +
                    '\n\nproduct Quantity:$amount' +
                    '\n\nproduct description:$description' +
                    '\n\nContact Number:$number',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.grey[900],
                  fontWeight: FontWeight.w500,
                ),

                //Textstyle
              ),
            ))),
            Container(
                padding: const EdgeInsets.only(
                    left: 165.0, right: 95.0, bottom: 20, top: 500),
                child: new RaisedButton(
                    child: const Text('Place the Order'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => conform(
                                  name: name,
                                  amount: amount,
                                  price: price,
                                  description: description,
                                  number: number,
                                )),
                      );
                    })),
          ],
        ));
  }
}
