import 'item.dart';

class GroupItem {
  List<Item> items = [];
  String? name;
  String? description;
  double cost = 0;
  String unit = "";
  double weight = 0;
  double? totalWeight;
  double? totalCost;
  double? storageCapacity;

  GroupItem(this.items, this.name, this.description, this.cost, this.weight, this.storageCapacity) {
    double accumulatedWeight = 0;
    double accumulatedCost = 0;

    for (var e in items) {
      if (e.weight != null){
        accumulatedWeight = accumulatedWeight + e.weight!;
      }

      if (e.cost != null) {
        accumulatedCost = accumulatedCost + e.cost!;
      }
    }

    totalWeight = weight + accumulatedWeight;
    totalCost = cost + accumulatedCost;
  }

  GroupItem.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
    cost = double.parse(data['cost']);
    weight = double.parse(data['weight']);
    storageCapacity = double.parse(data['storageCapacity']);

    if (data['items'] != []) {
      data['items'].forEach((e) {
        items.add(Item.fromJSON(e));
      });

    }

    double accumulatedWeight = 0;
    double accumulatedCost = 0;

    for (var e in items) {
      if (e.weight != null){
        accumulatedWeight = accumulatedWeight + e.weight!;
      }

      if (e.cost != null) {
        accumulatedCost = accumulatedCost + e.cost!;
      }
    }

    totalWeight = weight + accumulatedWeight;
    totalCost = cost + accumulatedCost;
  }

}