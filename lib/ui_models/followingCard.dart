import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

Card flwngCard(String name, String avatar, String url) {
  _launchFlwng() async {
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
            color: Color.fromRGBO(16, 157, 88, 1),
            fontWeight: FontWeight.bold),
      ),
      leading: CircleAvatar(
      backgroundColor: Color.fromRGBO(102, 102, 102, 1),
        child: CircleAvatar(
          radius: 18,backgroundImage: NetworkImage(avatar),),radius: 20,),
      trailing: Container(
        width: 60,
        child: Row(
          children: <Widget>[
            GestureDetector(child: Icon(MaterialCommunityIcons.web),
            onTap: _launchFlwng,
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