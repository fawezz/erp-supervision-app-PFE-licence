

//login_view
final String fPostLoginAdress = "http://10.0.2.2:8080/mt-gpro-commun-rest/user/login";

//dvr_view
final String fGetDvrAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/dvr/all";

final String fRtspTest = 'rtsp://wowzaec2demo.streamlock.net/vod/mp4:BigBuckBunny_115k.mov';


//Clients
final String fGetClientsCacheAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/gestionProduitAOCache/listeClientCache";
//Produits
final String fGetProduitsAdress = "http://10.0.2.2:8080/mt-gpro-commun-rest/produit/all";
//Sites
final String fGetSitesAdress = "http://10.0.2.2:8080/mt-gpro-commun-rest/gestionnaireCache/listeSitePartieInteresseeCache";

//Chat
final String fGetConversationsAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/conversation/user";
final String fPostModifierConversationAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/conversation/modifier";
final String fPostCreerConversationAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/conversation/creer";
final String fPostNewMessageConversationAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/conversation/newMessage";

//notification
final String fWebsocketAdress = 'ws://10.0.2.2:8080/ma-gpro-gpao-rest/notification';
final String fStompAdress = "ws://10.0.2.2:8080/ma-gpro-gpao-rest/stomp";
//notification service GPAO
final String fPostNotificationAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/notification/listerNotificationNonObserver";

///Dashboard

final fGetCritereByTypeAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/critere/getByType";
final fPostCreerCritereAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/critere/creer";
//age stock
final String fPostAgeStockAdress = "http://10.0.2.2:8080/ma-gpro-gs-rest/entiteStock/etat-age-pourcentage";

//fiabilite actuel
final String fPostFiabiliteActuelAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/planning-of/rechercheMulticritereCommandeNonPlanifiesAvecEnCours";

//fiabilite passe
final String fPostFiabilitePasseAdress = "http://10.0.2.2:8080/ma-gpro-gpao-rest/planning-of/rechercheMulticriterePlanifiesPasseAvecEnCours";

//Mauvais Pilotage
final String fPostMauvaisPilotage = "http://10.0.2.2:8080/ma-gpro-gpao-rest/planning-of/rechercheMulticritereCommandeNonPlanifiesAvecEnCours";
final String fPostVariationMauvaisPilotage = "http://10.0.2.2:8080/ma-gpro-gpao-rest/historiqueMauvaisPilotage/rechercheMulticritereVariationFiabilitePlanning";
//Taux occupation
final String fPostTauxOccupationAdress = "http://10.0.2.2:8080/ma-gpro-gs-rest/entiteStock/rechercheParCritere";

//Users
final String fGetAllUsersAdress = "http://10.0.2.2:8080/mt-gpro-commun-rest/user/getAll";

final fWeekDays = {"Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"};
final fMonths = {"Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"};