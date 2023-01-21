import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final Stream<QuerySnapshot> goods =
      FirebaseFirestore.instance.collection('goods').snapshots();
  @override
  Widget build(BuildContext context) {
    appBar:
    AppBar(
      title: Text('Pass Data from ListView to next Screen'),
    );
    return Container(
        height: 250,
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: StreamBuilder<QuerySnapshot>(
          stream: goods,
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Text("Loading");
            }
            final data = snapshot.requireData;
            return Card(
                child: ListView.builder(
              itemCount: data.size,
              itemBuilder: (context, index) {
                return Text(
                  "Goods name is${data.docs[index]['goods_name']}",
                );

                Text(
                  "Goods price is${data.docs[index]['goods_price']}",
                );
                leading:
                SizedBox(
                  width: 50,
                  height: 50,
                );

                return Text("Goods price is${data.docs[index]['goods_price']}");
              },
            ));
          },
        ));
  }
}
