import 'package:flutter/material.dart';

class Incremente extends StatefulWidget {

  @override
  State<Incremente> createState() => _IncrementeState();
}

class _IncrementeState extends State<Incremente> {
  //const Incremente({Key? key}) : super(key: key);
  int compteur =0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("INCREMENT"),
      ),
      body: Center(
        child: Text ("INCREMENT: ${compteur}",style: TextStyle(color: Colors.blueAccent,fontSize: 54),),

      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),

        onPressed: (){
          setState(() {
            ++compteur;
            print(compteur);
          });
        },
      ),
    );
  }
}
