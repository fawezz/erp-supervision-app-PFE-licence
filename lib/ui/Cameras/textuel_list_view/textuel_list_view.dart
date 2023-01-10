import 'package:application_de_supervision/ui/Cameras/textuel_list_view/textuel_list_viewmodel.dart';
import 'package:application_de_supervision/widgets/containerGradiant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
class TextuelListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
              child: Get.arguments == null ? CircularProgressIndicator():
              ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: Get.arguments["dvr"].nbrCamera,
                  itemBuilder: (context, index){
                    print(Get.arguments["dvr"]);
                    return Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: ContainerGradiant(
                          child: Center(
                            child: ListTile(
                              horizontalTitleGap: 50,
                              leading: Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Icon(FontAwesomeIcons.video,size: 40 ,color: Colors.black,),)
                              ,
                              title: Text("Camera N° " + (index + 1).toString(),
                                  style: TextStyle(fontSize: 28, color: Colors.black)),
                              onTap: (){
                                Get.toNamed('/singleCamera',
                                  arguments: {"dvr":Get.arguments["dvr"], "index": index.toString()},);
                                // Get.toNamed('/camera', arguments: model.dvrList[index] );

                              },
                            ),
                          ),
                        ));
                  })
          ),
        ),
      ),

      viewModelBuilder: () => TextuelListViewModel(),
    );
  }
}
