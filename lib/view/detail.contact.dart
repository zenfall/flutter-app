
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http ;

class Detail extends StatelessWidget {


   dynamic etudiantData;
   String? nom;
   Detail( {this.etudiantData, this.nom });
   TextEditingController nomController = TextEditingController ();
   TextEditingController prenomController = TextEditingController ();
   TextEditingController matriculeController = TextEditingController ();
   TextEditingController idController = TextEditingController ();

   final formKey = GlobalKey<FormState>();
   //const Detail ({Key? key}) : super(key: key);
      // {Detail(this.etudiantData);}

  @override
  Widget build(BuildContext context) {
    print(etudiantData);
    nomController.text = etudiantData["nom"].toString();
    prenomController.text = etudiantData["prenom"].toString();
    matriculeController.text = etudiantData["matricule"].toString();
    idController.text = etudiantData["id"].toString();

    return Scaffold(

    appBar: AppBar(
    title: Text("Detail"),
      ),

    body: Center(
      child: Container(
        child: Card(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 50.0,
                width: 1000.0,

               child: ListTile(
                  title:Text("Nom" ),
                  trailing: Text("${nomController.text }"),

                ),

              ),
              Container(
                height: 50.0,
                width: 1000.0,

                child: ListTile(
                  title:Text("Prenom"),
                  trailing: Text("${prenomController.text }"),

                ),

              ),
              Container(
                height: 50.0,
                width: 1000.0,

                child: ListTile(
                  title:Text("Matricule"),
                  trailing: Text("${matriculeController.text }"),
                ),

              ),
              Container(
                height: 50.0,
                width: 1000.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        child: Text("Annuler"),
                      onPressed:(){
                          print("Annuler ");

                          Fluttertoast.showToast(
                              msg: "Annuler",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 5,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                    }
                      ),
                    SizedBox(width: 10.0),

                    ElevatedButton(
                        child: Text("Supprimer"),
                        onPressed:(){
                          print("Supprimer");
                         // print("${idController.text }");
                          supprimerEtudiant(int.parse(idController.text.toString()));
                        }
                    )

                  ],
                ),

              ),
            ],
          ),
        ),
      ),
    )
    );
  }

   Future supprimerEtudiant(int id) async {
    print(id);
     var url = 'http://localhost:8989/api-flutter/etudiant/supprimerEtudiant/${id}';
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


