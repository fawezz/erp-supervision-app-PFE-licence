import 'package:application_de_supervision/ui/Cameras/stream_list_view/stream_list_view.dart';
import 'package:application_de_supervision/ui/Cameras/textuel_list_view/textuel_list_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

import 'dvr_tab_viewmodel.dart';

class DvrTabView extends StatelessWidget {
  const DvrTabView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.white,
              bottom: TabBar(
                labelColor: Colors.white,
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.cyan,
                indicator: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.blueAccent, HexColor("#7ee8fa")]),
                        borderRadius: BorderRadius.circular(50),
                ),
                tabs: [
                  Tab(child: Text("liste des cameras", style: TextStyle(fontSize: 20),)),
                  Tab(child: Text("liste des streams",style: TextStyle(fontSize: 20)))
              ],),
            ),
            body: TabBarView(
              children: [
                TextuelListView(),
                StreamListView()
              ],
            ),
            ),
          ),
      ),

        viewModelBuilder: () => DvrTabViewModel()
    );
  }
}
