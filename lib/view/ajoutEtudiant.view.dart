import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        title: Text("Detail"),
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
                      etudiant.add(nomController.text);
                      etudiant.add( prenomController.text);
                      etudiant.add(matriculeController.text);
                      JsonDecoder(etudiant);
                      Navigator.pop(context);
                    }
                  },
                  child: Text('Ajouter'),
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
    );
  }

  Future ajoutEtudiant() async {

    var url = 'http://localhost:8989/api-flutter/etudiant/ajoutEtudiant';
    print(url);
    var reponse = await http.delete(Uri.parse(url));
    //setState(() {

    print("La reponse  ${reponse.statusCode}");
    print("Le body  ${reponse.body}");
    if( reponse.statusCode ==200){
      //listEtudiant = json.decode(reponse.body) ;
    }

    // });

  }
}
