import 'package:application_de_supervision/ui/login/login_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:stacked/stacked.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key key}) : super(key: key );

  final userNameController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  /*@override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }*/

  final Shader customGradient = LinearGradient(
    colors: <Color>[Colors.greenAccent, Colors.cyan],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      builder: (context, model, child) =>
          SafeArea(
            child: Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      colors: [HexColor("#380036"), HexColor("#0cbaba")]
                    )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Form(key: _formKey,
                        child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26),
                                  color: Colors.white
                              ),
                              child: Title(color: Colors.lightBlueAccent,
                                child: Text("Bienvenue", style: TextStyle(fontSize: 30, foreground: Paint()..shader = customGradient,
                                    )
                                )
                              )
                          ),
                        ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: userNameController,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String value){
                            if(value.isEmpty)
                            {
                              return "champ obligatoire";
                            }
                            else
                            if(value.length<4)
                            {
                              return "Nom d'utilisateur invalide";
                            }
                            else
                              return null;
                          },
                          decoration: InputDecoration(
                            //fillColor: Colors.white,
                            //filled: true,
                            labelStyle: TextStyle(color: Colors.cyan, ), //hint color
                            labelText: "Nom d'utilisateur",
                            hintText: "Saisir votre nom d'utilisateur",
                            hintStyle: TextStyle(color: Colors.white60,),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(color: Colors.white, width: 1),)

                          ),
                        ),
                      ),

                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                        child: TextFormField(
                          style: TextStyle(color: Colors.white),
                          controller: passwordController,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: true,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (String value){
                            if(value.isEmpty)
                            {
                              return "champ obligatoire";
                            }
                            else
                            if(value.length<4)
                            {
                              return "mot de passe invalide";
                            }
                            else
                              return null;
                          },
                          decoration: InputDecoration(
                            errorStyle: TextStyle(fontSize: 14,),
                            labelText: "Mot de passe",
                            hintText: "Saisir votre mot de passe",
                            labelStyle: TextStyle(color: Colors.cyan),
                            hintStyle: TextStyle(color: Colors.white60),
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                            enabledBorder:  OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 1),
                        ),

                          ),
                        ),
                      ),
                    ])
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text("Se connecter", style: TextStyle(color: Colors.white, fontSize: 22),),
                        FloatingActionButton(elevation: 0,
                            foregroundColor:  Colors.lightBlueAccent,
                            backgroundColor: Colors.white,
                            child: const Icon(Icons.arrow_forward, size: 36,),

                            onPressed: ()
                            {
                              if (_formKey.currentState.validate()) {
                                Get.context.showLoaderOverlay();
                                model.setPassword(
                                    passwordController.value.text);
                                model.setUserName(
                                    userNameController.value.text);
                                model.postLogin();
                              }
                              else{
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(content: Text("nom d'utilisateur ou mot de passe invalide")));
                              }
                            })

                      ],),
                    ),
                    /*Align(alignment: Alignment.bottomRight,child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Text("Mot de passe oublié?", style: TextStyle(color: Colors.white),),
                    )),*/
                  ],
                ),
              ),
            ),
          ),
      viewModelBuilder: () => LoginViewModel(),
    );
  }
}
