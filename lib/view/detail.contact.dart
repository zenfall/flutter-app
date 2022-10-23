
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {


   dynamic etudiantData;
   String? nom;
   Detail( {this.etudiantData, this.nom});
   TextEditingController nomController = TextEditingController ();
   //const Detail ({Key? key}) : super(key: key);
      // {Detail(this.etudiantData);}

  @override
  Widget build(BuildContext context) {
    print(etudiantData);
    nomController.text = nom.toString();
    return Scaffold(

    appBar: AppBar(
    title: Text("Detail"),
      ),

    body: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            child: TextField(
              controller: nomController,
              maxLength: 25,
              decoration: const InputDecoration(
                  labelText: 'Champ de formulaire',
                  hintText: 'Entrer du texte',
                  border: OutlineInputBorder()),

            )
        ),
      )

    )





    );
  }
}
