import 'dart:io';
import 'package:farmers_sago/LocationTracking.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farmers_sago/catlog1.dart';
import 'package:farmers_sago/gdf.dart';
import 'package:farmers_sago/productslist.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:farmers_sago/LoginScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:farmers_sago/utils/color_utils.dart';
import 'package:firebase_storage/firebase_storage.dart';

//import 'package:fltter_file_upload_login_screen/login_screen.dart';
import 'package:flutter/material.dart';

class Goods extends StatefulWidget {
  const Goods({Key? key}) : super(key: key);

  @override
  State<Goods> createState() => _GoodsState();
}

class _GoodsState extends State<Goods> {
  FilePickerResult? result;
  String? _fileName;
  PlatformFile? pickedfile;
  bool isLoading = false;
  File? fileToDisplay;
  void pickFile() async {
    try {
      setState(() {
        isLoading = true;
      });
      setState(() {
        isLoading = false;
      });
      result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        allowMultiple: true,
      );
      if (result != null) {
        // _fileName = result!.files.first.name;
        //  pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File name $_fileName');
      }
    } catch (e) {
      print(e);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  String radioItem = '';
  var goods_name = "";
  var goods_description = "";
  var goods_quantity = "";
  var goods_price = "";
  var mobile_number = 0;
  var Town_name = "";
  var Taluk_name = "";
  @override
  Widget build(BuildContext context) {
    //final Storage storage = Storage();
    CollectionReference goods = FirebaseFirestore.instance.collection('goods');
    return Scaffold(
      appBar: AppBar(
        title: Text('Goods Page'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(children: <Widget>[
        Center(
            child: Card(
                //shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(30.0),
                //),
                child: Container(
                    padding: EdgeInsets.all(16),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                          hexStringToColor("#FFFFFF"),
                          hexStringToColor("#FFFFFF"),
                          hexStringToColor("5E61F4")
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)),
                    child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                          DefaultTextStyle.merge(
                            child: Container(
                                child: Align(
                                    alignment: Alignment(-1, -2),
                                    child: Text('Upload Your Goods Photo'))),
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                          ),
                          Container(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : ElevatedButton(
                                    onPressed: () async {
                                      final results =
                                          await FilePicker.platform.pickFiles(
                                        type: FileType.any,
                                        allowMultiple: true,
                                      );
                                      if (results == null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                'No file has been selected.'),
                                          ),
                                        );
                                      }
                                      final path = results!.files.single.path!;
                                      final fileName =
                                          results.files.single.name;
                                      // storage
                                      // .uploadFile(path, fileName)
                                      // .then((value) => print('Done'));
                                      //pickFile();
                                    },
                                    child: Text('Upload')),
                          ),
                          FutureBuilder(
                              // future: storage.listFiles(),
                              builder: (BuildContext context,
                                  AsyncSnapshot snapshot) {
                            if (snapshot.connectionState ==
                                    ConnectionState.done &&
                                snapshot.hasData) {
                              return Container(
                                height: 100,
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: snapshot.data!.items.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                            snapshot.data!.items[index].name),
                                      );
                                    }),
                              );
                            }
                            if (snapshot.connectionState ==
                                    ConnectionState.waiting ||
                                !snapshot.hasData) {
                              return CircularProgressIndicator();
                            }
                            return Container();
                          }),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Goods Name'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              goods_name = value;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Goods Quantity'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              goods_quantity = value;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Goods Description'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              goods_description = value;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Price of Goods'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              goods_price = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter the Taluk name'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              Taluk_name = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                                hintText: 'Enter the town name'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              Town_name = value;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(hintText: 'Mobile Number'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              mobile_number = int.parse(value);
                            },
                          ),
                          Container(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 40.0),
                            child: new RaisedButton(
                              child: const Text('Submit'),
                              onPressed: () {
                                goods
                                    .add({
                                      'goods_name': goods_name,
                                      'goods_description': goods_description,
                                      'good_quantity': goods_quantity,
                                      'goods_price': goods_price,
                                      'mobile_number': mobile_number,
                                      'Town_name': Town_name,
                                      'Taluk_name': Taluk_name
                                    })
                                    .then((value) => print("Goods Updated"))
                                    .catchError((error) =>
                                        print("Faild to Add the goods:$error"));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()),
                                );
                              },
                            ),
                          )
                        ]))))))
      ]),
    );
  }
}
