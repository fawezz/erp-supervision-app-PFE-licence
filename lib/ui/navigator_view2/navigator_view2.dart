
import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/widgets/navDrawer.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

import 'navigator_viewmodel2.dart';

class NavigatorView2 extends StatelessWidget {
  const NavigatorView2({Key key}) : super(key: key);

  final Color iconColor = Colors.cyan;
  final double iconSize = 32;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          //appBar: AppBar(),
          //drawer: navDrawer(),
          body: model.Tabs[model.selectedIndex],
          bottomNavigationBar: CurvedNavigationBar(
            color: Colors.white,
            backgroundColor: Colors.cyan,
            buttonBackgroundColor: Colors.white,
            index: model.selectedIndex,
            height: 56,
            items: <Widget>[
              Icon(Icons.home, size: iconSize, color: iconColor,),
              Icon(Icons.chat, size: iconSize, color: iconColor,),
              Icon(Icons.notifications, size: iconSize, color: iconColor,)
            ],
            onTap: (index) {
              if(index == 2)
                postNotifications();
              model.setSelectedIndex(index);
            },
          ),
        ),
      ),
        viewModelBuilder: () => NavigatorViewModel2(),
    );
  }
}
