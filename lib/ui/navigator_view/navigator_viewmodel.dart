import 'package:application_de_supervision/ui/Cameras/dvr_view/dvr_view.dart';
import 'package:application_de_supervision/ui/dashboard/principal/dashboard_principale_view.dart';
import 'package:application_de_supervision/ui/login/login_view.dart';
import 'package:application_de_supervision/ui/messaging/chat_view.dart';
import 'package:application_de_supervision/ui/notification_view/notification_view.dart';
import 'package:application_de_supervision/ui/startup/startup_view.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

class NavigatorViewModel extends BaseViewModel{

  int _selectedIndex = Get.arguments == null? 0:  Get.arguments["tabNumber"];
  List _tabs = [DashboardPrincipaleView(), ChatView(), DvrView(), NotificationView()];  //NotificationView()




  int get selectedIndex => _selectedIndex;

  void setSelectedIndex(int value) {
    _selectedIndex = value;
    notifyListeners();
  }

  List get Tabs => _tabs;



}
