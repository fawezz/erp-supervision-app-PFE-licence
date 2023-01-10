import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'single_camera_viewFutureModel.dart';
class SingleCameraView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) => SafeArea(
        child: Scaffold(
          body: Center(
            //child: model.isBusy? CircularProgressIndicator():
            child: Stack(
              alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Visibility(visible: model.busyy,
                          child: Center(child: CircularProgressIndicator())),
                    ),
                    Positioned.fill(
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Visibility(
                          maintainState: true,
                          child: Hero(
                            tag: "vlc",
                            child: VlcPlayer(
                              controller: model.videoPlayerController,
                              aspectRatio: 16 / 10,
                              //placeholder: Center(child: CircularProgressIndicator()),
                            ),
                          ),
                          visible: !model.busyy,
                        ),
                      ),
                    )
                  ],
                ),

            )
          )
        ),


      viewModelBuilder: () => SingleCameraViewFutureModel(),
    );
  }
}
