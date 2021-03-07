//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:itsewa/constants.dart';
import 'package:itsewa/screens/cart_page.dart';
//import 'package:itsewa/services/firebase_services.dart';

import 'package:flutter/material.dart';

class CustomActionBar extends StatefulWidget {
  final String title;
  final bool hasBackArrrow;
  final bool hasTitle;
  final bool hasBackground;
  CustomActionBar(
      {this.title, this.hasBackArrrow, this.hasTitle, this.hasBackground});

  @override
  _CustomActionBarState createState() => _CustomActionBarState();
}

class _CustomActionBarState extends State<CustomActionBar> {
  //FirebaseServices _firebaseServices = FirebaseServices();

  //final CollectionReference _usersRef =
  //FirebaseFirestore.instance.collection("Users");

  @override
  Widget build(BuildContext context) {
    bool _hasBackArrow = widget.hasBackArrrow ?? false;
    bool _hasTitle = widget.hasTitle ?? true;
    bool _hasBackground = widget.hasBackground ?? true;

    return Container(
      decoration: BoxDecoration(
          gradient: _hasBackground
              ? LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white.withOpacity(0),
                  ],
                  begin: Alignment(0, 0),
                  end: Alignment(0, 1),
                )
              : null),
      padding: EdgeInsets.only(
        top: 56.0,
        left: 24.0,
        right: 24.0,
        bottom: 42.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (_hasBackArrow)
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/images/back_arrow.png"),
                  color: Colors.white,
                  width: 16.0,
                  height: 16.0,
                ),
              ),
            ),
          if (_hasTitle)
            Text(
              widget.title ?? "Action Bar",
              style: Constants.boldHeading,
            ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(),
                  ));
            },
            child: Container(
                width: 42.0,
                height: 42.0,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("assets/images/cart.png"),
                  color: Colors.white,
                  width: 16.0,
                  height: 16.0,
                )),
          )
        ],
      ),
    );
  }
}
