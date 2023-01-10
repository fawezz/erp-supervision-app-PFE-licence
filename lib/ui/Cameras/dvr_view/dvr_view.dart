import 'package:application_de_supervision/models/dvrModel.dart';
import 'package:application_de_supervision/widgets/containerGradiant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dvr_viewFutureModel.dart';
class DvrView extends StatelessWidget {

  DVR currentDvr;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Liste DVR"),
            backgroundColor: Colors.cyan,
          ),
          body: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.white
            ),
            child: Center(
              child: model.dvrList == null ? CircularProgressIndicator():
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ListView.builder(
                  cacheExtent: 10,
                    itemCount: model.dvrList.length,
                    itemExtent: 100,
                    itemBuilder: (context, index){

                      currentDvr = model.dvrList[index];
                      return Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ContainerGradiant(
                                  child: Center(
                                    child: ListTile(
                                    horizontalTitleGap: 60,
                                    leading: Padding(
                                      padding: const EdgeInsets.only(left: 18),
                                      child: Icon(FontAwesomeIcons.digitalTachograph,size: 60 ,color: Colors.cyan[400],),
                                    ),
                                    title: Text(currentDvr.titre, style: TextStyle(fontSize: 24),),
                                    trailing: Padding( padding: const EdgeInsets.only(right: 16),
                                      child: Text(currentDvr.nbrCamera.toString(), style: TextStyle(fontSize: 22),
                                      ),
                                    ),
                                    subtitle: Text(currentDvr.type, style: TextStyle(fontSize: 18)),
                                    onTap: (){
                                        Get.toNamed('/dvrTab', arguments: {"dvr" : model.dvrList[index]});
                                     // Get.toNamed('/camera', arguments: model.dvrList[index] );

                                    },
                            ),
                                  ),
                                ),
                      );
                    }),
              ),
            ),
          ),
        ),
      ),
      viewModelBuilder: () => DvrViewFutureModel(),
    );




  }
}
