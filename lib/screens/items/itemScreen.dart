import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dndsystem/models/groupItem.dart';
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
            groupItemList()
          ],
        );

  }
}

itemsList() {
  return
    Container(
      height: 800,
      child: StreamBuilder(
        stream: firestore.collection("items").orderBy('name').snapshots(),
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
                  trailing: IconButton(onPressed: () async {
                    await snapshot.data!.docs[i].reference.delete();
                    snackbarWidget(context, "Item deleted");
                  }, icon: Icon(Icons.delete)),
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

  groupItemList() {
    return
      Container(
        height: 800,
        child: StreamBuilder(
          stream: firestore.collection("groupItem").orderBy('name').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            return snapshot.hasData ? ListView.builder(
                padding: EdgeInsets.all(20),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, i) {
                  GroupItem groupItem = GroupItem.fromJSON(snapshot.data!.docs[i].data() as Map<String, dynamic>);
                  return ListTile(
                    onTap: () {
                      showDialog(context: context, builder: (_) => AlertDialog(
                          title: Text(groupItem.name!),
                          content: Container(
                              height: 300,
                              width: 350,
                              child: SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: Column(
                                  children: [
                                    Text("Description: ${groupItem.description!}"),
                                    Text("Weight: ${groupItem.totalWeight.toString()} lb"),
                                    Text("Cost: ${groupItem.totalCost.toString()}"),
                                    Text("Contents: "),
                                    Container(
                                      height: 200,
                                      width: 250,
                                      child: ListView.builder(
                                          itemCount: groupItem.items.isEmpty ? 0 : groupItem.items.length,
                                          itemBuilder: (context, i) {
                                            return ListTile(
                                              title: Text(groupItem.items[i].name!),
                                              trailing: Text(groupItem.items[i].quantity.toString(), style: TextStyle(fontSize: 15)),
                                            );
                                          }),
                                    )
                                  ],
                                ),
                              )
                          )));
                    },
                    title: Text(groupItem.name!),
                    trailing: IconButton(onPressed: () async {
                      await snapshot.data!.docs[i].reference.delete();
                      snackbarWidget(context, "Item deleted");
                    }, icon: Icon(Icons.delete)),
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
