import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:github_profile_analyser/DataRepository/dataRepository.dart';
import 'package:github_profile_analyser/ui_models/displayProfile.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: <Widget>[
            Container(
              width: size.width,
              height: size.height * 0.38,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                   dp('${user.map['avatar_url']}'),
                    Padding(padding: EdgeInsets.only(top: 10)),
                    Text(
                      '${user.map['name']}',
                      style: TextStyle(
                          fontFamily: 'Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Padding(padding: EdgeInsets.only(top: 2)),
                    Text(
                      '@${user.map['login']}',
                      style: TextStyle(
                          fontFamily: 'Sans',
                          color: Colors.white,
                          fontSize: 11,
                          fontStyle: FontStyle.italic),
                    ),
                    if (user.map['email'] != null)
                      Padding(padding: EdgeInsets.only(top: 2)),
                    if (user.map['email'] != null)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            MaterialCommunityIcons.gmail,
                            color: Colors.white,
                            size: 13,
                          ),
                          Padding(padding: EdgeInsets.only(right: 5)),
                          Text(
                            '${user.map['email']}',
                            style: TextStyle(
                                fontFamily: 'Sans',
                                color: Colors.white,
                                fontSize: 11,
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    if (user.map['bio'] != null)
                      Padding(padding: EdgeInsets.only(top: 5)),
                    if (user.map['bio'] != null)
                      Text(
                        '${user.map['bio']}',
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontFamily: 'Sans',
                            color: Colors.white,
                            fontSize: 13),
                      ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(35),
                    topRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                     Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          if(user.map['public_repos']<999)
                          Text('${user.map['public_repos']}', style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold,fontSize: 20),),
                          if(user.map['public_repos']>999)
                          Text('${user.map['public_repos']/1000}k', style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('repositories',style: TextStyle(fontFamily: 'Sans',fontSize: 13,color: Colors.grey),)
                        ],
                        ),
                        Container(width: 0.4,color: Colors.black,height: 44,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text('-', style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('starred',style: TextStyle(fontFamily: 'Sans',fontSize: 13,color: Colors.grey),)
                        ],
                        ),
                        Container(width: 0.4,height: 44,color: Colors.black,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          if(user.map['followers']<999)
                          Text('${user.map['followers']}', style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold,fontSize: 20),),
                          if(user.map['followers']>999)
                          Text('${user.map['followers']/1000}k', style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('followers',style: TextStyle(fontFamily: 'Sans',fontSize: 13,color: Colors.grey),)
                        ],
                        ),
                        Container(width: 0.4,height: 44,color: Colors.black,),
                        Column(mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          if(user.map['following']<999)
                          Text('${user.map['following']}', style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold,fontSize: 20),),
                          if(user.map['following']>999)
                          Text('${user.map['following']/1000}k', style: TextStyle(fontFamily: 'Sans',fontWeight: FontWeight.bold,fontSize: 20),),
                          Text('following',style: TextStyle(fontFamily: 'Sans',fontSize: 13,color: Colors.grey),)
                        ],
                        ),
                      ],
                    ),
                    Padding(padding: EdgeInsets.only(top:10)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:14.0),
                      child: Container(width: size.width,
                      height: 0.4,
                      color: Colors.black,
                      ),
                    )
                  ],),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
