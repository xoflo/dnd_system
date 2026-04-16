import 'item.dart';

class GroupItem {
  List<Item>? items;
  String? name;
  String? description;
  double cost;
  double weight;
  double? totalWeight;
  double? totalCost;
  double? storageCapacity;

  GroupItem(this.items, this.name, this.description, this.cost, this.weight, this.storageCapacity) {
    double accumulatedWeight = 0;
    double accumulatedCost = 0;

    items?.forEach((e) {
      if (e.weight != null){
        accumulatedWeight = accumulatedWeight + e.weight!;
      }

      if (e.cost != null) {
        accumulatedCost = accumulatedCost + e.cost!;
      }
    });

    totalWeight = weight + accumulatedWeight;
    totalCost = cost + accumulatedCost;
  }

}