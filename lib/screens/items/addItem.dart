import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dndsystem/builderWidgets/statSelector.dart';
import 'package:dndsystem/builderWidgets/unitSelector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';
import '../../models/item.dart';


class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  ValueNotifier<String?> category = ValueNotifier('Armor');


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Add Item"),
              Divider(),
              categorySelect(),
              SizedBox(height: 10),
              ValueListenableBuilder(
                  valueListenable: category,
                  builder:
                  (BuildContext context, String? value, Widget? child) {
                    return Padding(
                      padding: EdgeInsets.all(20),
                        child: screenBuilder(value!));
                  })
            ],
          )),
    );
  }

  categorySelect() {
    return ValueListenableBuilder(
      valueListenable: category,
      builder: (BuildContext context, String? value, Widget? child) {
        return Row(
          children: [
            card("Armor"),
            card("Tool"),
            card("Weapon"),
            card("Item"),
            card("Group Item"),
          ],
        );
      },
    );
  }

  card(String content) {
    return Container(
        width: 100,
        height: 50,
        child: GestureDetector(
            onTap: () {
              category.value = content;
            },
            child: Card(
              color: category.value == content ? Colors.red : Colors.white,
              child: Center(
                child: Text(content),
              ),)));
  }



  armorFormat() {
    return Column(
      children: [

        Text("Armor")
      ],
    );
  }


  toolFormat() {
    List<String> stat = [];
    String statDesc = "Ability";
    TextEditingController name = TextEditingController();
    TextEditingController weightController = TextEditingController();
    TextEditingController costController = TextEditingController();
    TextEditingController desc = TextEditingController();
    UnitSelector unit = UnitSelector();

    return Column(
      children: [
        Text("Tool"),
        TextField(
          controller: name,
          decoration: InputDecoration(
              hintText: 'Tool Name'
          )
        ),
        StatSelector(stat: stat, statDesc: statDesc),
        TextField(
          controller: desc,
          onChanged: (value) {

            desc.text = desc.text.replaceAll(RegExp(r'\s+'), ' ').trim();
          },
          maxLines: 5,
          decoration: InputDecoration(
              hintText: 'Description'
          ),
        ),
        TextField(
          controller: costController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Cost'
          ),
        ),
        unit,
        TextField(
          controller: weightController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Weight'
          ),
        ),
        SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            name.clear();
            desc.clear();
            weightController.clear();
            costController.clear();
            stat.clear();
            unit.unit = "";

            setState(() {
              category.value = "Tool";
            });
          }, child: Text("Clear")
        ),
        SizedBox(height: 10),
        ElevatedButton(onPressed: () async {
          loadingWidget(context);
          await firestore.collection('tools').add({
            'name': name.text,
            'description': desc.text,
            'weight': weightController.text,
            'stat': stat.last,
            'cost': costController.text,
            'unit': unit.unit
          });

          name.clear();
          desc.clear();
          weightController.clear();
          costController.clear();
          stat.clear();
          unit.unit = "";


          Navigator.pop(context);
          snackbarWidget(context, "Tool Added");

          setState(() {
            category.value = "Tool";
          });
        }, child: Text("Save"))
      ],
    );
  }

  weaponFormat() {
    return Column(
      children: [
        Text("Weapon")
      ],
    );
  }

  itemFormat() {

    TextEditingController name = TextEditingController();
    TextEditingController desc = TextEditingController();
    TextEditingController weight = TextEditingController();
    TextEditingController cost = TextEditingController();

    UnitSelector unitSelector = UnitSelector();

    return Column(
      children: [
        TextField(
          controller: name,
          decoration: InputDecoration(
            hintText: 'Item Name'
          ),
        ),
        TextField(
          controller: desc,
          maxLines: 5,
          decoration: InputDecoration(
              hintText: 'Description'
          ),
        ),
        TextField(
          controller: weight,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Weight'
          ),
        ),
        TextField(
          controller: cost,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Cost'
          ),
        ),
        unitSelector,
        ElevatedButton(onPressed: () {
          name.clear();
          desc.clear();
          weight.clear();
          cost.clear();
        }, child: Text("Clear")),

        SizedBox(height: 10),
        ElevatedButton(onPressed: () async {
          loadingWidget(context);

          String finalDesc = desc.text.replaceAll(RegExp(r'\s+'), ' ').trim();


          await firestore.collection("items").add({
            'name': name.text,
            'description': finalDesc,
            'weight': weight.text,
            'cost': cost.text,
            'unit': unitSelector.unit,
          });
          
          Navigator.pop(context);
          snackbarWidget(context, "Item added to database");

          name.clear();
          desc.clear();
          weight.clear();
          cost.clear();
          unitSelector.unit = "";

        }, child: Text("Save"))


      ],
    );
  }


  groupItemFormat() {
    TextEditingController name = TextEditingController();
    TextEditingController desc = TextEditingController();
    TextEditingController weight = TextEditingController();
    TextEditingController cost = TextEditingController();
    TextEditingController storageCapacity = TextEditingController();

    UnitSelector unitSelector = UnitSelector();

    ValueNotifier<List<Item>> items = ValueNotifier([]);


    return Column(
      children: [
        TextField(
          controller: name,
          decoration: InputDecoration(
              hintText: 'Group Item Name'
          ),
        ),
        TextField(
          controller: desc,
          maxLines: 5,
          decoration: InputDecoration(
              hintText: 'Description'
          ),
        ),
        TextField(
          controller: weight,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Weight'
          ),
        ),
        TextField(
          controller: cost,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Cost'
          ),
        ),
        unitSelector,
        TextField(
          controller: storageCapacity,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              hintText: 'Storage Capacity (if applicable)'
          ),
        ),
        SizedBox(height: 10),
        Column(
          children: [
            Text("Added Items:", style: TextStyle(fontSize: 20)),
            Container(
              height: 400,
              width: 400,
              child: ValueListenableBuilder(
                valueListenable: items,
                builder: (BuildContext context, List<Item> value, Widget? child) {
                  return ListView.builder(
                      itemCount: value.length,
                      itemBuilder: (context, i) {
                        return ListTile(
                          title: Text(value[i].name!),
                          trailing: Text(value[i].quantity.toString(), style: TextStyle(fontSize: 15)),
                        );
                      });
                },
              ),
            )
          ],
        ),
        Column(
          children: [
            Text("Item List:", style: TextStyle(fontSize: 20)),
            Container(
              height: 400,
              width: 400,
              child: StreamBuilder(
                stream: firestore.collection('items').orderBy('name').snapshots(),
                builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  return snapshot.hasData ? ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, i) {
                        final item = Item.fromJSON(snapshot.data!.docs[i].data() as Map<String, dynamic>);

                        return ListTile(
                          title: Text(item.name!),
                          onTap: () {
                            List<Item> newItems = [];
                            newItems = items.value.toList();

                            if (newItems.contains(item)) {
                              newItems[newItems.indexOf(item)].quantity++;
                            } else {
                              newItems.add(item);
                            }

                            items.value = newItems;
                          },
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
            )
          ],
        ),
        ElevatedButton(onPressed: () {
          name.clear();
          desc.clear();
          weight.clear();
          cost.clear();
        }, child: Text("Clear")),

        SizedBox(height: 10),
        ElevatedButton(onPressed: () async {
          loadingWidget(context);

          String finalDesc = desc.text.replaceAll(RegExp(r'\s+'), ' ').trim();

          final totalWeight = items.value.fold<double>(
            0,
                (sum, e) => sum + (e.weight ?? 0),
          );

          final totalCost = items.value.fold<double>(
            0,
                (sum, e) => sum + (e.cost ?? 0),
          );

          await firestore.collection("groupItem").add({
            'name': name.text,
            'description': finalDesc,
            'weight': weight.text,
            'cost': cost.text,
            'totalWeight': totalWeight + double.parse(weight.text),
            'totalCost': totalCost + double.parse(cost.text),
            'storageCapacity': storageCapacity.text == "" ? "0" : storageCapacity.text,
            'unit': unitSelector.unit,
            'items': items.value.map((e) => e.toJSON()).toList()
          });

          Navigator.pop(context);
          snackbarWidget(context, "Item added to database");

          name.clear();
          desc.clear();
          weight.clear();
          cost.clear();
          storageCapacity.clear();
          items.value = [];

        }, child: Text("Save"))


      ],
    );
  }

  Widget screenBuilder(String category) {
    switch (category) {
      case 'Weapon':
        return weaponFormat();
      case 'Armor':
        return armorFormat();
      case 'Item':
        return itemFormat();
      case 'Tool':
        return toolFormat();
      case 'Group Item':
        return groupItemFormat();
      default:
        return Text("Error");
    }
  }
}