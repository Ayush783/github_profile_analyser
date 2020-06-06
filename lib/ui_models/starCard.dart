import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

Card starCard(String name, String lang ,String userName, String url) {
  _launchStar() async {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
      }
    }
  return Card(
    color: Color(0xffe2ded3),
    child: ListTile(
      title: Text(
        userName,
        style: TextStyle(
            fontFamily: 'Sans',
            color:  Color.fromRGBO(249, 187, 4, 1),
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text.rich(TextSpan(text: '$name,\n',style: TextStyle(fontFamily: 'Sans',fontSize: 16,color: Colors.black),children: [
        TextSpan(text: lang==null?'':lang,style: TextStyle(color: Colors.grey,fontSize: 13))
      ]),
      ),
      trailing: Container(
        width: 60,
        child: Row(
          children: <Widget>[
            GestureDetector(child: Icon(MaterialCommunityIcons.web),
            onTap: _launchStar,
            ),
            Padding(padding: EdgeInsets.only(right: 10)),
            GestureDetector(
                onTap: () {
                  Share.share(
                      'Check out $userName\'s $name Github repository\n$url');
                },
                child: Icon(MaterialCommunityIcons.share))
          ],
        ),
      ),
    ),
  );
}
