
import 'package:application_de_supervision/widgets/agePieChart.dart';
import 'package:application_de_supervision/widgets/conversation_list_item.dart';
import 'package:application_de_supervision/widgets/navDrawer.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:smart_select/smart_select.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';
import 'critere_viewFutureModel.dart';
import 'package:loader_overlay/loader_overlay.dart';


class CritereView extends StatelessWidget {
   CritereView({Key key}) : super(key: key );


   final observationsController = TextEditingController();
   final nomController = TextEditingController();

   final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              body: Center(
                child: SizedBox(
                  height: double.infinity,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Form(child: Column(
                          children: [
                            SmartSelect<String>.single(
                              value: model.selectedType,
                              placeholder: "Selectionner",
                              modalType: S2ModalType.bottomSheet,
                              title: 'Type',
                              choiceItems: model.options,
                              onChange: (value){
                                model.updateSelectedType(value.value);
                              }),
                            SmartSelect<int>.single(
                                value: model.selectedIdClient,
                                placeholder: "Selectionner",
                                modalType: S2ModalType.bottomSheet,
                                title: 'Client',
                                choiceItems: model.listClients,
                                onChange: (value){
                                  model.setSelectedIdClient(value.value);
                                }),
                            SmartSelect<int>.single(
                              value: model.selectedIdSite,
                                placeholder: "Selectionner",
                                modalType: S2ModalType.bottomSheet,
                                title: 'Site',
                                choiceItems: model.listSites,
                                onChange: (value){
                                  model.setSelectedIdSite(value.value);
                                }),
                            SmartSelect<int>.single(
                                value: model.selectedIdProduit,
                                placeholder: "Selectionner",
                                title: 'Produit',
                                choiceItems: model.listProduits,
                                onChange: (value){
                                  model.setSelectedIdProduit(value.value);
                                }),
                            Form(key: _formKey,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                                    child: TextFormField(
                                    controller: nomController,
                                validator: (String value){
                                  if (value.isEmpty) {
                                    return "Champ obligatoir" ;
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                  //fillColor: Colors.white,
                                  //filled: true,
                                  labelStyle: TextStyle(color: Colors.black, ), //hint color
                                  labelText: "Nom",
                                  hintText: "Saisir le nom du Critere",
                                  hintStyle: TextStyle(color: Colors.black,),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                                ),
                              ),
                            ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                                    child: TextFormField(
                                      controller: observationsController,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        //fillColor: Colors.white,
                                        //filled: true,
                                        labelStyle: TextStyle(color: Colors.black, ), //hint color
                                        labelText: "Observations",
                                        hintText: "Saisir les observations",
                                        hintStyle: TextStyle(color: Colors.black,),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                                      ),
                                    ),
                                  ),
                        ]),
                            ),
                            ElevatedButton(
                                onPressed: () async {
                                  if (_formKey.currentState.validate()) {
                                    model.setObservations(
                                        observationsController.value.text);
                                    model.setNom(nomController.value.text);
                                    int result = await model.valider();
                                    if(result == 200)
                                      {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(content: Text("Creation Terminé avec Succes")));
                                      }
                                    else
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text("creation echoué")));
                                  }
                                  /*
                                  else{
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(content: Text("nom d'utilisateur ou mot de passe invalide")));
                                  }*/
                                },
                                child: Text("Valider"))
                          ],))
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        viewModelBuilder: () => CritereViewFutureModel(),
    );
  }
}

