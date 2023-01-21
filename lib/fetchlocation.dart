import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LOC extends StatelessWidget {
  final String lat = "11";
  final String lng = "76";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("URL Launcher"),
      ),
      body: Column(
        children: <Widget>[
          // ...
          ListTile(
            title: Text("Launch Maps"),
            onTap: () async {
              final String googleMapsUrl = "comgooglemaps://?center=$lat,$lng";
              final String appleMapsUrl = "https://maps.apple.com/?q=$lat,$lng";

              if (await canLaunch(googleMapsUrl)) {
                await launch(googleMapsUrl);
              }
              if (await canLaunch(appleMapsUrl)) {
                await launch(appleMapsUrl, forceSafariVC: false);
              } else {
                throw "Couldn't launch URL";
              }
            },
          ),
        ],
      ),
    );
  }
}
