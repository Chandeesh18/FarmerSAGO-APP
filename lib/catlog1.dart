import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_sago/CatlogCard.dart';
import 'package:farmers_sago/GoodsPage.dart';
import 'package:farmers_sago/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';

class NoteList extends StatelessWidget {
  final db = FirebaseFirestore.instance;
  //constructor Snippet Code
  String taluk, town;
  NoteList({Key? key, required this.taluk, required this.town})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("goods"),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: db.collection('goods').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
           // print('Your Taluk is: $taluk');
           // print('Your Town is: $town');

            return ListView(
              children: snapshot.data!.docs.map((doc) {
                margin:
                const EdgeInsets.symmetric(vertical: 80);
                return Card(
                    child: InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  ),
                  child: ListTile(
                    dense: false,

                    //  leading: Image.network(
                    //  doc['img'],
                    //  scale: 1,
                    // ),

                    title: Text("\n" + doc['goods_name']),

                    trailing: Text(doc['goods_price']),
                    //subtitle: Text(doc['goods_description']),
                    leading: Text(doc['good_quantity']),
                    subtitle: Column(
                      children: <Widget>[
                        Text(doc['goods_description']),
                        FlatButton(
                            child: Text('Buy'),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Catlog(
                                        name: doc['goods_name'],
                                        amount: doc['good_quantity'],
                                        price: doc['goods_price'],
                                        description: doc['goods_description'],
                                        number: doc['mobile_number'])),
                              );
                            })
                      ],
                    ),
                  ),
                ));
              }).toList(),
            );
          }
        },
      ),
    );
  }
}
