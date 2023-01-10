import 'package:application_de_supervision/app/Constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ConversationListItem extends StatelessWidget {

  String name;
  String messageText;
  String imageUrl;
  DateTime time;
  bool isMessageRead = false;
  Function onClickFunction;
  ConversationListItem({@required this.name,@required this.messageText,@required this.imageUrl,@required this.time,@required this.onClickFunction});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClickFunction,
      child: Container(
        padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                    maxRadius: 30,
                  ),
                  SizedBox(width: 16,),
                  Expanded(
                    child: Container(
                      color: Colors.transparent,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(name, style: TextStyle(fontSize: 16),),
                          SizedBox(height: 6,),
                          Text(messageText,style: TextStyle(fontSize: 13,color: Colors.grey.shade600,
                              fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            DateTime.now().day != time.day? //is the last message of the conversation today or an older day
              //if older than today then is it less than a week show name of day else show month and date
            (Text(
                DateTime.now().difference(time)<Duration(days: 7) ?
                fWeekDays.elementAt(time.weekday-1):
                fMonths.elementAt(time.month) + " " + time.day.toString(), // if older then show the name of the weekday
              style: TextStyle(fontSize: 12,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),)):
            //today then show time //if minutes are less than 10 then add 0 before the number of minutes
            Text(time.hour.toString() + ":" + (time.minute > 9? time.minute.toString(): "0" + time.minute.toString()),
              style: TextStyle(fontSize: 12,fontWeight: isMessageRead?FontWeight.bold:FontWeight.normal),),

          ],
        ),
      ),
    );
  }
}
