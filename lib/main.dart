import 'package:flutter/material.dart';
import 'package:premierapp/view/accueil.view.dart';
import 'package:premierapp/view/contact.view.dart';
import 'package:premierapp/view/detail.contact.dart';
import 'package:premierapp/widgets/menu.widgets.dart';

void main (){
  runApp(Supdeco());
}


class Supdeco extends StatelessWidget {
  const Supdeco ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {"/home":(context)=> Accueil(),
               "/contact":(context)=> Contact(),
               "/detail": (context)=> Detail(),
      },
      initialRoute: "/home",

      //home: Accueil(),
    );
  }
}




