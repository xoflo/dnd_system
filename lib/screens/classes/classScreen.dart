
import 'package:dndsystem/screens/classes/addClassScreen.dart';
import 'package:flutter/material.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (_)=> AddClassScreen()));
      }, child: Icon(Icons.add)),
      body: Container(
        child: Column(
          children: [

            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),
            Text("Classes"),
            Divider(),
            Container(
              height: 400,
              child: ListView.builder(
                  itemCount: 2,
                  itemBuilder: (context, i) {
                return ListTile(
                  title: Text("Test"),
                );
              }),
            )
        ]
      ))
    );
  }
}
