import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../../models/item.dart';
import 'addItem.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {

  int screenIndex = 0;

  List<String> categories = ['Armor', 'Weapon', 'Tool', 'Item', 'Group Item'];

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

            Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  padding: EdgeInsets.all(10),
                  scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, i) {
                      return Container(
                        height: 60,
                        width: 120,
                        child: ElevatedButton(
                            onPressed: () {
                          setState(() {
                            screenIndex = i;
                          });
                        }, child: Text(categories[i])),
                      );
                    }),
            ),
            screenBuilder(screenIndex),

          ],
        ),

      ));
  }

  screenBuilder(int i) {
    switch (i) {
      case 0:
        return Column(
          children: [
            Text("Armors"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
          ],
        );
      case 1:
        return Column(
          children: [
            Text("Weapons"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
          ],
        );
      case 2:
        return Column(
          children: [
            Text("Tools"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
          ],
        );
      case 3:
        return Column(
          children: [
            Text("Items"),
            itemsList(),
          ],
        );
      case 4:
        return Column(
          children: [
            Text("Group Item"),
            Container(
              height: 300,
              child: ListView.builder(itemBuilder: (context, i) {
                return ListTile();
              }),
            ),
          ],
        );

  }
}

itemsList() {
  return
    Container(
      height: 300,
      child: StreamBuilder(
        stream: firestore.collection("items").snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return snapshot.hasData ? ListView.builder(
            padding: EdgeInsets.all(20),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, i) {
                Item item = Item.fromJSON(snapshot.data!.docs[i].data() as Map<String, dynamic>);
                return ListTile(
                  onTap: () {
                    showDialog(context: context, builder: (_) => AlertDialog(
                        title: Text(item.name!),
                        content: Container(
                            height: 300,
                            width: 350,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Text("Description: ${item.description!}"),
                                  Text("Weight: ${item.weight!.toString()}"),
                                  Text("Cost: ${item.cost!.toString()} ${item.unit!}"),
                                ],
                              ),
                            )
                        )));
                  },
                  title: Text(item.name!),
                );
              }) : Center(
            child: Container(
              height: 50,
              width: 50,
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );}
}
