import 'package:flutter/material.dart';

import 'addItem.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddItemScreen()),
        );
      }),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            IconButton(onPressed: (){
              Navigator.pop(context);
            }, icon: Icon(Icons.arrow_back)),

            Text("Armors"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
            SizedBox(height: 20),

            Text("Tools"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
            SizedBox(height: 20),

            Text("Items"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
            SizedBox(height: 20),


            Text("Weapons"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
            SizedBox(height: 20),
          ],
        ),

      ));
  }
}
