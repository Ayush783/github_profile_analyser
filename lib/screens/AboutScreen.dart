import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/ui_models/blogButton.dart';
import 'package:github_profile_analyser/ui_models/gitbutton.dart';
import 'package:github_profile_analyser/ui_models/gmailButton.dart';
import 'package:github_profile_analyser/ui_models/shareButton.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  Widget _gitWidget, _gmailWidget, _blogWidget;
  bool showError;
  @override
  void initState() {
    super.initState();
    showError = false;
    _gitWidget = Icon(
      MaterialCommunityIcons.github_circle,
      size: 34,
    );
    _gmailWidget = Icon(
      MaterialCommunityIcons.gmail,
      size: 34,
    );
    _blogWidget = Icon(
      MaterialCommunityIcons.blogger,
      size: 34,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    _launchGit() async {
      setState(() {
        _gitWidget = SpinKitPulse(
          color: Colors.white,
          duration: Duration(milliseconds: 700),
          size: 30,
        );
      });
      final url = '${user.map['html_url']}';
      if (await canLaunch(url)) {
        await launch(url);
        setState(() {
          showError = false;
          _gitWidget = Icon(
            MaterialCommunityIcons.github_circle,
            size: 34,
          );
        });
      } else {
        setState(() {
          showError = true;
          _gitWidget = Icon(
            MaterialCommunityIcons.github_circle,
            size: 34,
          );
        });
      }
    }

    _launchBlog() async {
      setState(() {
        _blogWidget = SpinKitPulse(
          color: Colors.white,
          duration: Duration(milliseconds: 700),
          size: 30,
        );
      });
      final url = 'https://${user.map['blog']}';
      if (await canLaunch(url)) {
        await launch(url);
        showError = false;
        setState(() {
          _blogWidget = Icon(
            MaterialCommunityIcons.blogger,
            size: 34,
          );
        });
      } else {
        setState(() {
          showError = true;
          _blogWidget = Icon(
            MaterialCommunityIcons.blogger,
            size: 34,
          );
        });
      }
    }

    _launchGmail() async {
      setState(() {
        _gmailWidget = SpinKitPulse(
          color: Colors.white,
          duration: Duration(milliseconds: 700),
          size: 30,
        );
      });
      final Uri mail = Uri(scheme: 'mailto', path: '${user.map['email']}');
      print(mail);
      final url = mail.toString();
      if (await canLaunch(url)) {
        await launch(url);
        showError = false;
        setState(() {
          _gmailWidget = Icon(
            MaterialCommunityIcons.gmail,
            size: 34,
          );
        });
      } else {
        setState(() {
          showError = true;
          _gmailWidget = Icon(
            MaterialCommunityIcons.gmail,
            size: 34,
          );
        });
      }
    }

    shareProfile() {
      Share.share(
          'Check out ${user.map['name']}\'s Github Profile\n${user.map['html_url']}');
    }

    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xff5c5757),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Github Explorer',
              style: new TextStyle(
                color: Colors.black,
                shadows: [Shadow(color: Colors.grey, blurRadius: 10)],
                fontFamily: 'Sans',
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50)),
            Material(
              borderRadius: BorderRadius.circular(30),
              elevation: 10,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  '${user.map['name']}',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Sans',
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              height: 194,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: <Widget>[
                  Lottie.asset('images/flame.json', height: 194),
                  Positioned(
                    left: 55.7,
                    bottom: 53.7,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        '${user.map['avatar_url']}',
                      ),
                      radius: 45,
                    ),
                  ),
                ],
              ),
            ),
            SelectableText(
              '@${user.map['login']}',
              style: TextStyle(fontFamily: 'Sans', fontStyle: FontStyle.italic),
            ),
            Text(
              '${user.map['location']}',
              style: TextStyle(fontFamily: 'Sans'),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  gmailButton(_launchGmail, _gmailWidget),
                  gitButton(_launchGit, _gitWidget),
                  blogButton(_launchBlog, _blogWidget),
                ],
              ),
            ),
            if (showError)
              Text(
                'Cannot launch url',
                style: TextStyle(
                    fontFamily: 'Sans', fontSize: 12, color: Colors.red),
              ),
            shareButton(shareProfile)
          ],
        ),
      ),
    ));
  }
}
