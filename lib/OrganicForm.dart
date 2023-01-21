import 'dart:io';
import 'package:farmers_sago/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
//import 'package:fltter_file_upload_login_screen/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:farmers_sago/utils/color_utils.dart';

class Loginscrren extends StatefulWidget {
  const Loginscrren({Key? key}) : super(key: key);

  @override
  State<Loginscrren> createState() => _LoginscrrenState();
}

class _LoginscrrenState extends State<Loginscrren> {
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
        allowMultiple: false,
      );
      if (result != null) {
        _fileName = result!.files.first.name;
        pickedfile = result!.files.first;
        fileToDisplay = File(pickedfile!.path.toString());

        print('File name $_fileName');
      }
    } catch (e) {
      print(e);
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey();
  String radioItem = '';
  var name = "";
  var city = "";
  var state = "";
  var dateofbirth = '';
  var mobile_number = '';
  var country = "";
  var address = "";
  @override
  Widget build(BuildContext context) {
    CollectionReference organic =
        FirebaseFirestore.instance.collection('organic');
    return Scaffold(
      appBar: AppBar(
        title: Text('Organic Farmer Form'),
        backgroundColor: Colors.purple,
      ),
      body: Stack(children: <Widget>[
        Center(
            child: Card(
                //shape: RoundedRectangleBorder(
                //borderRadius: BorderRadius.circular(30.0),
                //),
                child: Container(
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
                    padding: EdgeInsets.all(16),
                    child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                            child: Column(children: <Widget>[
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Name'),
                            keyboardType: TextInputType.name,
                            onChanged: (value) {
                              name = value;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Dateofbirth'),
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value) {
                              dateofbirth = value;
                            },
                          ),
                          TextFormField(
                            decoration:
                                InputDecoration(labelText: 'Phone Number'),
                            keyboardType: TextInputType.number,
                            onChanged: (value) {
                              mobile_number = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Address'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              address = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'City'),
                            keyboardType: TextInputType.text,
                            onChanged: (value) {
                              city = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'State'),
                            keyboardType: TextInputType.streetAddress,
                            onChanged: (value) {
                              state = value;
                            },
                          ),
                          TextFormField(
                            decoration: InputDecoration(hintText: 'Country'),
                            keyboardType: TextInputType.streetAddress,
                            onChanged: (value) {
                              country = value;
                            },
                          ),
                          DefaultTextStyle.merge(
                            child: Container(
                                child: Align(
                                    alignment: Alignment(-1, -2),
                                    child: Text('Files'))),
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                          ),
                          DefaultTextStyle.merge(
                            child: Container(
                                child: Align(
                                    alignment: Alignment(-1, -2),
                                    child: Text('Upload your Licenses'))),
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                          ),
                          Container(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : TextButton(
                                    onPressed: () {
                                      pickFile();
                                    },
                                    child: Text('Upload')),
                          ),
                          if (pickedfile != null)
                            SizedBox(
                                height: 1200,
                                width: 1000,
                                child: Image.file(fileToDisplay!)),
                          DefaultTextStyle.merge(
                            child: Container(
                                child: Align(
                                    alignment: Alignment(-1, -2),
                                    child: Text('Upload the Land Images'))),
                            style:
                                TextStyle(color: Colors.black87, fontSize: 20),
                          ),
                          Container(
                            child: isLoading
                                ? CircularProgressIndicator()
                                : TextButton(
                                    onPressed: () {
                                      pickFile();
                                    },
                                    child: Text('Upload')),
                          ),
                          if (pickedfile != null)
                            SizedBox(
                                height: 1200,
                                width: 1000,
                                child: Image.file(fileToDisplay!)),
                          Container(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 40.0),
                            child: new RaisedButton(
                              child: const Text('Submit'),
                              onPressed: () {
                                organic
                                    .add({
                                      'name': name,
                                      'city': city,
                                      'address': address,
                                      'phone number': mobile_number,
                                      'country': country,
                                      'date of birth': dateofbirth,
                                      'state': state
                                    })
                                    .then(
                                        (value) => print("Details are Updated"))
                                    .catchError((error) => print(
                                        "Faild to Add the details:$error"));
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Login()),
                                );
                              },
                            ),
                          )
                        ]))))))
      ]),
    );
  }
}
