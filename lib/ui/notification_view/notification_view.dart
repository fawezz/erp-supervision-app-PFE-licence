
import 'package:application_de_supervision/app/Constants.dart';
import 'package:application_de_supervision/app/designConstants.dart';
import 'package:application_de_supervision/models/notificationGpaoModel.dart';
import 'package:application_de_supervision/widgets/agePieChart.dart';
import 'package:application_de_supervision/widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:stacked/stacked.dart';
import 'notification_viewModel.dart';


class NotificationView extends StatelessWidget {
   NotificationView({Key key}) : super(key: key );



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              appBar: AppBar(title: Text("Notifications"),
                flexibleSpace: Container(
                  decoration: BoxDecoration(
                      /*gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: <Color>[
                            Colors.green,
                            Colors.blue
                          ])*/
                    color: appBarColor
                  ),),
              ),
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    /*gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [ Colors.blue[100], Colors.lightGreen[100],]
                    )*/
                ),
                child: Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: model.notifications.length,
                      cacheExtent: 30,
                      itemBuilder: (context, index) {
                        NotificationGpao currentNotification = model.notifications.elementAt(index);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                    offset: Offset(0, 2.0), // shadow direction: bottom right
                                  )
                                ],
                              color: Colors.white,
                              border: Border.all( width: 3,
                                  color: model.getColor(currentNotification.typeDesignation))
                            ),
                            child: ListTile(title: Text(currentNotification.typeDesignation,style: TextStyle(fontWeight: FontWeight.bold),),
                              subtitle: Text(currentNotification.numeroOF),
                              //trailing: Text(Text(time.hour.toString() + ":" + (time.minute > 9? time.minute.toString(): "0" + time.minute.toString())),
                            trailing: Text(currentNotification.date.day.toString() + " " +
                                fMonths.elementAt(currentNotification.date.month) + " à " +
                                currentNotification.date.hour.toString() + ":" +
                            (currentNotification.date.minute > 9? currentNotification.date.minute.toString(): "0" +
                            currentNotification.date.minute.toString()),
                            )),
                          ),
                        );
                      }
                      /*child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.cyan,
                            width: MediaQuery.of(context).size.width,
                            child: Text("Composant:", style: TextStyle(fontSize: 28, color: Colors.white),),),
                        ],*/
                      ),
                    ),
                  ),
              ),
              ),
            ),
        viewModelBuilder: () => NotificationViewModel(),
    );
  }
}

