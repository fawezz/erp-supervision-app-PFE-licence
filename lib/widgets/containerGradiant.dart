import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
class ContainerGradiant extends StatelessWidget {
  final Widget _child;
  final Color _color2 = HexColor("#7ee8fa");
  final Color _color1  = Colors.blue[200];
  ContainerGradiant({@required Widget child,}) :
        this._child = child;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [_color1, _color2],
          ),
        ),
        child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              child: _child,
            )
        )
    );
  }
}
