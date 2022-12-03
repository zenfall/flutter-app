import 'dart:convert';
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:premierapp/main.dart';
import 'package:premierapp/view/ajoutEtudiant.view.dart';
import 'package:premierapp/view/detail.contact.dart';
import 'package:premierapp/view/modifier.view.dart';
import 'package:premierapp/widgets/menu.widgets.dart';
import 'package:http/http.dart' as http;

class Contact extends StatefulWidget {
  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
//  const Contact({Key? key}) : super(key: key);
 List <dynamic> listEtudiant= [];
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getListEtudiant();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

        appBar: AppBar(
          title: Text("First App"),
          leading: IconButton(onPressed: () {
            Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>
                Supdeco() ) );
            }, icon: const Icon(Icons.arrow_back),
          ),
        ),

        body: Center(

        child: ListView.separated(separatorBuilder: (context, index) => const Divider(height: 5,color: Colors.black,),

             itemCount: /*(listEtudiant== null) ? 0 :*/ listEtudiant.length,
             itemBuilder: (context, index) {
             return ListTile(

               onTap: (){
                 print(listEtudiant[index] );
                   Navigator.push(context, MaterialPageRoute(builder: (context) =>Detail(etudiantData:listEtudiant[index], nom:listEtudiant[index]["nom"]) ) );

               },
               title: InkWell(

                 child: Text("${listEtudiant[index]["nom"]}"),

               ),
               subtitle: Text("${listEtudiant[index]["prenom"]}"),
               trailing: Text("${listEtudiant[index]["matricule"]}"),
               leading: IconButton(onPressed: () {
                 Navigator.push(context, 
                     MaterialPageRoute(builder: (context) =>
                         ModifierEtudiant(etudiantData:listEtudiant[index]) ) );
               }, icon: const Icon(Icons.brush),

               )  ,

             );
         },),
        ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) =>AjoutEtudiant() ) );
        },
      ),
    );

  }

  Future getListEtudiant() async {
    var url = 'http://localhost:8989/api-flutter/etudiant/listEtudiant';
    print(url);
    var reponse = await http.get(Uri.parse(url));
    setState(() {

        print("La reponse  ${reponse.statusCode}");
        print("Le body  ${reponse.body}");
        if( reponse.statusCode ==200){
          listEtudiant = json.decode(reponse.body) ;
        }

     });

  }
}




