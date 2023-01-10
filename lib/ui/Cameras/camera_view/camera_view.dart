import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'camera_viewFutureModel.dart';
class CameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            child: model.isBusy? CircularProgressIndicator():
            ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: Get.arguments.nbrCamera,
                itemBuilder: (context, index) {
                  return ListTile(title:
                  VlcPlayer(
                    controller: model.videoPlayerControllers[index],
                    aspectRatio: 16 / 10,
                    //placeholder: Center(child: CircularProgressIndicator()),
                  ),
                  );
                }

            ),
          ),
        ),
      ),
      viewModelBuilder: () => CameraViewFutureModel(),
    );

  }
}
