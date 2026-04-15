import 'package:dndsystem/builderWidgets/unitSelector.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../globals.dart';


class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {

  ValueNotifier<String?> category = ValueNotifier('Weapon');


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

  weaponFormat() {
    return Column(
      children: [
        Text("Weapon")
      ],
    );
  }

  armorFormat() {
    return Column(
      children: [

        Text("Armor")
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

          String finalDesc = desc.text.trim().replaceAll(RegExp(r'\s+'), ' ');


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

        }, child: Text("Save"))


      ],
    );
  }


  toolFormat() {
    return Column(
      children: [

        Text("Tool")
      ],
    );
  }

  groupItemFormat() {
    return Column(
      children: [

        Text("Group")
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