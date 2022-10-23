import 'package:flutter/material.dart';
import 'package:premierapp/view/accueil.view.dart';
import 'package:premierapp/view/contact.view.dart';
import 'package:premierapp/view/incremente.view.dart';


class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(child:       Center(child: CircleAvatar(
            backgroundImage: AssetImage("images/logo.png"),
            radius: 52,

          ),)
            ,),

          ListTile(
            title:Text("Accueil"),
            leading: Icon(Icons.home),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>Accueil() ) );

            },
          ),

          ListTile(
            title:Text("Contact"),
            leading: Icon(Icons.verified_user),
            trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Contact() ) );
              }
          ),

          ListTile(
              title:Text("Incremente"),
              leading: Icon(Icons.insert_chart_rounded),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: (){
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Incremente() ) );
              }
          ),

        ],

      ),

    );
  }
}