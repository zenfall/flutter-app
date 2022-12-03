import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:premierapp/view/contact.view.dart';

class ModifierEtudiant extends StatelessWidget {
 // const ModifierEtudiant({Key? key}) : super(key: key);

  dynamic etudiantData;
  final formKey = GlobalKey<FormState>();
  ModifierEtudiant( {this.etudiantData});
  TextEditingController nomController = TextEditingController ();
  TextEditingController prenomController = TextEditingController ();
  TextEditingController matriculeController = TextEditingController ();
  TextEditingController idController = TextEditingController ();



  @override
  Widget build(BuildContext context) {

    print(etudiantData);
    nomController.text = etudiantData["nom"].toString();
    prenomController.text = etudiantData["prenom"].toString();
    matriculeController.text = etudiantData["matricule"].toString();
    idController.text = etudiantData["id"].toString();

    return Scaffold(
      appBar: AppBar(
        title: Text("Modifier"),
        leading: IconButton(onPressed: () {
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) =>
        Contact() ) );
        }, icon: const Icon(Icons.arrow_back),
      ),
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
                      labelText: 'Matricule',
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

                      modifierEtudiant(nomController.text, prenomController.text,
                          matriculeController.text,int.parse(idController.text.toString()) );

                      Navigator.pop(context);
                    }
                  },
                  child: Text('Modifier'),
                ),

              ),

              SizedBox(height: 8.0),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {

                      Navigator.pop(context);
                    }
                  },
                  child: Text('Annuler'),
                ),

              ),
            ]
        ),
      ) ,
    );;
  }

  Future modifierEtudiant(String nom,String prenom, String matricule,int id) async {


    var url = 'http://localhost:8989/api-flutter/etudiant/modifierEtudiant/${id}';
    print(url);
    var reponse = await http.put(Uri.parse(url),
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
      print("Etudiant modifier !");
    }

    // });

  }

}
