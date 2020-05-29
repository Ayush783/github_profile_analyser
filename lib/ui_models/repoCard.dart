import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

Card repoCard(String name, String lang, String userName, String url,String description) {
  _launchRepo() async {
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
            color:  Color.fromRGBO(234, 66, 53, 1),
            fontWeight: FontWeight.bold),
      ),
      subtitle: Text.rich(
        TextSpan(text: "${lang==null?'':lang+'\n'}"
        
      ,children: [
        TextSpan(text: "${description==null?'':description}"),
      ]),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      ),
      trailing: Container(
        width: 60,
        child: Row(
          children: <Widget>[
            GestureDetector(child: Icon(MaterialCommunityIcons.web),
            onTap: _launchRepo,
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
