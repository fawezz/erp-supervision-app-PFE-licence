import 'package:flutter/material.dart';

class ShadowedContainer extends StatelessWidget {

  final Widget child;
  ShadowedContainer({Key key, this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: MediaQuery
          .of(context)
          .size
          .height / 3.2,
      width: MediaQuery
          .of(context)
          .size
          .width / 2.4,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            blurRadius: 10.0,
          ),
        ],

      ),
    );
  }
}