import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

Card flwrCard(String name, String avatar, String url) {
  _launchFlwr() async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
      }
    }
  return Card(
    child: ListTile(
      title: Text(
        name,
        style: TextStyle(
            fontFamily: 'Sans',
            color:  Color.fromRGBO(66, 134, 245, 1),
            fontWeight: FontWeight.bold),
      ),
      leading: CircleAvatar(
      backgroundColor: Colors.green,
        child: CircleAvatar(
          radius: 18,backgroundImage: NetworkImage(avatar),),radius: 20,),
      trailing: Container(
        width: 60,
        child: Row(
          children: <Widget>[
            GestureDetector(child: Icon(MaterialCommunityIcons.web),
            onTap: _launchFlwr,
            ),
            Padding(padding: EdgeInsets.only(right: 10)),
            GestureDetector(
                onTap: () {
                  Share.share(
                      'Check out $name\'s Github profile\n$url');
                },
                child: Icon(MaterialCommunityIcons.share))
          ],
        ),
      ),
    ),
  );
}