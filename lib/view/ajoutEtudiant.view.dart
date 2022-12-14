import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:premierapp/view/contact.view.dart';

class AjoutEtudiant extends StatelessWidget {
  //const ({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController ();
  TextEditingController prenomController = TextEditingController ();
  TextEditingController matriculeController = TextEditingController ();
  TextEditingController idController = TextEditingController ();

  dynamic etudiant = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajout Etudiant"),
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) =>
          Contact() ) );
    }, icon: const Icon(Icons.arrow_back),

    )  ,
      ),
      body: Form(
        key: formKey,
        child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: nomController,
                  decoration: InputDecoration(
                      labelText: 'Nom',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Champs obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: prenomController,
                  decoration: InputDecoration(
                      labelText: 'Prenom',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Champs obligatoire';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 16.0, left: 16.0, right: 16.0, bottom: 8.0),
                child: TextFormField(
                  controller: matriculeController,
                  decoration: InputDecoration(
                      labelText: 'Prenom',
                      border: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0)))),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Champs obligatoire';
                    }
                    return null;
                  },
                ),
              ),

              SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(

                  onPressed: () {

                    if (formKey.currentState!.validate()) {
                      // etudiant.add(nomController.text);
                      // etudiant.add( prenomController.text);
                      // etudiant.add(matriculeController.text);

                      ajoutEtudiant(nomController.text, prenomController.text,
                          matriculeController.text).then((value) {
                            print(value);
                            if(value == 200 ) {
                              print("in if ");
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>Contact() ));

                              Fluttertoast.showToast(
                                  msg: "Etudiant ajout?? avec succ??s",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 5,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                      });

                     // Navigator.pop(context);
                    }
                  },
                  child: Text('Ajouter'),
                ),

              ),

              SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {


                      Navigator.pop(context);

                  },
                  child: Text('Annuler'),
                ),

              ),
            ]
        ),
      ) ,
    );
  }

  Future  ajoutEtudiant(String nom,String prenom, String matricule) async {


    var url = 'http://localhost:8989/api-flutter/etudiant/ajoutEtudiant';
    print(url);
    var reponse = await http.post(Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'nom': nom,
        'prenom' : prenom,
        'matricule': matricule,
      }),
    );
    //setState(() {

    print("La reponse  ${reponse.statusCode}");
    print("Le body  ${reponse.body}");
    if( reponse.statusCode ==200){
      //listEtudiant = json.decode(reponse.body) ;
      print("Etudiant cr??e avec succ??s !");
      return reponse.statusCode;

    }

    // });

  }
}
