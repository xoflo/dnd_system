import 'item.dart';

class GroupItem {
  List<Item>? items;
  String? description;
  int? cost;
  int? weight;

  GroupItem(this.items, this.description, this.cost, this.weight) {
    int accumulatedWeight = 0;

    items?.forEach((e) {
      if (e.weight != null){
        accumulatedWeight = accumulatedWeight + e.weight!;
      }
    });
  }

}