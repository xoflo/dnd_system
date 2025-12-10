import 'package:dndsystem/models/tool.dart';
import 'package:dndsystem/models/weapon.dart';
import 'armor.dart';
import 'item.dart';

class Inventory {
  int? quantity;
  Item? item;
  Armor? armor;
  Weapon? weapon;
  Tool? tool;

  Inventory();

  Inventory.fromJSON(Map<String, dynamic> data) {
    quantity = data['quantity'];
    item = data['item'];
    armor = data['armor'];
    weapon = data['weapon'];
    tool = data['tool'];
  }

  toJSON() {
    return {
      'quantity': quantity,
      'item': item,
      'armor': armor,
      'weapon': weapon,
      'tool': tool,
    };
  }
}