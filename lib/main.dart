

import 'package:application_de_supervision/app/httpService.dart';
import 'package:application_de_supervision/app/sharedPrefsService.dart';
import 'package:application_de_supervision/app/stompService.dart';
import 'package:application_de_supervision/ui/Cameras/dvr_tab_View/dvr_tab_view.dart';
import 'package:application_de_supervision/ui/Cameras/dvr_view/dvr_view.dart';
import 'package:application_de_supervision/ui/Cameras/single_camera_view/single_camera_view.dart';
import 'package:application_de_supervision/ui/dashboard/ageDuStock/age_stock_view.dart';
import 'package:application_de_supervision/ui/dashboard/critere/critere_view.dart';
import 'package:application_de_supervision/ui/dashboard/fiabiliteActuel/fiabilite_actuel_view.dart';
import 'package:application_de_supervision/ui/dashboard/fiabilitePasse/fiabilite_passe_view.dart';
import 'package:application_de_supervision/ui/dashboard/mauvaisPilotage/mauvais_pilotage_view.dart';
import 'package:application_de_supervision/ui/dashboard/principal/dashboard_principale_view.dart';
import 'package:application_de_supervision/ui/dashboard/tauxOccupation/taux_occupation_view.dart';
import 'package:application_de_supervision/ui/dashboard/variationMauvaisPilotage/variation_mauvais_pilotage_view.dart';
import 'package:application_de_supervision/ui/login/login_view.dart';
import 'package:application_de_supervision/ui/messaging/chat_detail_View.dart';
import 'package:application_de_supervision/ui/messaging/chat_view.dart';
import 'package:application_de_supervision/ui/messaging/create_conversation_view.dart';
import 'package:application_de_supervision/ui/navigator_view/navigator_view.dart';
import 'package:application_de_supervision/ui/navigator_view2/navigator_view2.dart';
import 'package:application_de_supervision/ui/notification_view/notification_view.dart';
import 'package:application_de_supervision/ui/startup/startup_view.dart';
import 'package:loader_overlay/loader_overlay.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  initializeNotif();
   await SharedPrefsSerivce.initPrefs();
  var id = SharedPrefsSerivce.currentUserId;
  if(id != null) {
    subscribeStomp();
    postNotifications();
  }
  print("main function : current logged in user id : " + id.toString());
  runApp(MyApp(id!=null));
}

class MyApp extends StatelessWidget {
  final bool loggedAlready;

  MyApp(this.loggedAlready);

  @override
  Widget build(BuildContext context) {
    return GlobalLoaderOverlay(
      useDefaultLoading: true,
      child: GetMaterialApp(
        initialRoute: loggedAlready ? (SharedPrefsSerivce.currentUserRole == 'manager'? '/navigator1': '/navigator2'):'/login'  ,

        getPages: [
          GetPage(name: '/navigator1', page: () => NavigatorView()),
          GetPage(name: '/navigator2', page: () => NavigatorView2()),
          GetPage(name: '/startUp', page: () => StartUpView()),
          GetPage(name: '/login', page: () => LoginView()),
          ///dashboard
          GetPage(name: '/dashboard', page: () => DashboardPrincipaleView()),
          GetPage(name: '/critere', page: () =>CritereView()),

          GetPage(name: '/fiabiliteActuel', page: () => FiabiliteActuelView()),
          GetPage(name: '/fiabilitePasse', page: () => FiabilitePasseView()),
          GetPage(name: '/ageDuStock', page: () => AgeStockView()),
          GetPage(name: '/tauxOccupation', page: () => TauxOccupationView()),
          GetPage(name: '/mauvaisPilotage', page: () => MauvaisPilotageView()),
          GetPage(name: '/variationPilotage', page: () => VariationPilotageView()),

          ///chat
          GetPage(name: "/chat", page: () => ChatView()),
          GetPage(name: '/chatDetail', page: () => ChatDetailView()),
          GetPage(name: '/createConversation', page: () => CreateConversationView()),

          ///Camera
          GetPage(name: '/dvr', page: () => DvrView()),
          GetPage(name: '/dvrTab', page: () => DvrTabView()),
          GetPage(name: '/singleCamera', page: () => SingleCameraView()),
          ///notification
          GetPage(name: '/notification', page: () => NotificationView()),
          //GetPage(name: '/camera', page: () => CameraView()),

        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,


      ),
    );
  }
}

