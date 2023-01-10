import 'package:flutter/material.dart';
import 'package:get/get.dart';
class MenuCard extends StatelessWidget {

  final String text;
  final IconData icon;
  final String action;
  MenuCard({Key key, @required this.text, @required this.icon, @required this.action});

  final Shader customGradient = LinearGradient(
    colors: <Color>[Colors.greenAccent, Colors.cyan],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
     return Container(
      margin: EdgeInsets.only(right: 10, left: 10, bottom: 20),
      height: MediaQuery.of(context).size.height/3.2,
      width: MediaQuery.of(context).size.width/0.3,
      padding: EdgeInsets.only(top: 8, right: 10, left: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 14.0,
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Text(text,style: TextStyle(fontSize: 28, foreground: Paint()..shader = customGradient), ),
          Container(
            padding: EdgeInsets.only(top: 2),
            height: MediaQuery.of(context).size.height/4.5,
            width: MediaQuery.of(context).size.width/4.5,
            child: FittedBox(
              fit: BoxFit.cover,
              child: FloatingActionButton(
                //backgroundColor: Colors.white,
                child:  Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [ Colors.blue, Colors.lightGreen,]
                  )),
                    child: Icon(icon,color: Colors.white, size: 36,)),
                elevation: 10,
                onPressed: () {
                    Get.toNamed(action);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

}
