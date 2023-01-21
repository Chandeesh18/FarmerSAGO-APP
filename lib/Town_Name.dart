import 'package:farmers_sago/catlog1.dart';
import 'package:flutter/material.dart';

import 'package:farmers_sago/utils/color_utils.dart';

class GetingInfo extends StatelessWidget {
  const GetingInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var taluk = "";
    var town = "";
    return Scaffold(
        appBar: AppBar(
          title: Text('Getting Location'),
          backgroundColor: Colors.purple,
        ),
        body: Stack(children: <Widget>[
          Center(
              child: Card(
                  //shape: RoundedRectangleBorder(
                  //borderRadius: BorderRadius.circular(30.0),
                  //),
                  child: Container(
                      padding: EdgeInsets.all(126),
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
                          child: SingleChildScrollView(
                              child: Column(children: <Widget>[
                        FutureBuilder(
                            // future: storage.listFiles(),
                            builder:
                                (BuildContext context, AsyncSnapshot snapshot) {
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
                          decoration: InputDecoration(
                              hintText: 'Enter your Taluk Name'),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            taluk = value;
                          },
                        ),
                        TextFormField(
                          decoration:
                              InputDecoration(hintText: 'Enter your Town Name'),
                          keyboardType: TextInputType.text,
                          onChanged: (value) {
                            town = value;
                          },
                        ),
                        Container(
                            padding:
                                const EdgeInsets.only(left: 15.0, top: 50.0),
                            child: new RaisedButton(
                                child: const Text('Get Products'),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NoteList(taluk: taluk, town: town)),
                                  );
                                })),
                      ]))))))
        ]));
  }
}
