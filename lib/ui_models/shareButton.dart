import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

RawMaterialButton shareButton(Function function) {
    return RawMaterialButton(
      fillColor: Colors.green,
            elevation: 5,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(width: 0.8, color: Colors.black)),
            onPressed: function,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 140,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Share Profile  ',
                      style: TextStyle(
                          fontFamily: 'Sans',
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(
                      MaterialCommunityIcons.share,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          );
  }