import 'package:flutter/material.dart';
import 'package:premierapp/widgets/menu.widgets.dart';

class Accueil extends StatelessWidget {
  const Accueil({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: MyDrawer(


      ),

      appBar: AppBar(
        title: Text("FirstApp"),
      ),


      body: Center(
        child: Text("Bonjour \n Accueil",style: TextStyle(color: Colors.blueAccent,fontSize: 54),),
      ),


    );
  }
}