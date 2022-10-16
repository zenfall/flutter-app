import 'package:flutter/material.dart';

void main (){
  runApp(Supdeco());
}


class Supdeco extends StatelessWidget {
  const Supdeco ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Accueil(),
    );
  }
}
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
        child: Text("Bonjour",style: TextStyle(color: Colors.blueAccent,fontSize: 54),),
      ),


    );
  }
}


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
           print('Bonjour');
         },
),

       ListTile(
         title:Text("Contact"),
         leading: Icon(Icons.usb_off_rounded),
         trailing: Icon(Icons.dangerous_sharp),
       ),
     ],

    ),

    );
  }
}
