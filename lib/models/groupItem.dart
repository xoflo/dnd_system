import 'item.dart';

class GroupItem {
  List<Item> items = [];
  String? name;
  String? description;
  double cost = 0;
  String unit = "";
  double weight = 0;
  double? totalWeight;
  String? totalCost;
  double? storageCapacity;

  GroupItem(this.items, this.name, this.description, this.cost, this.weight, this.storageCapacity) {
    double accumulatedWeight = 0;

    Map<String, double> totals = {
      'CP': 0,
      'SP': 0,
      'GP': 0,
      'PP': 0,
    };


    for (var e in items) {
      if (e.weight != null){
        accumulatedWeight = accumulatedWeight + e.weight!;
      }

      if (e.cost != null && e.unit != null) {
        totals[e.unit!] = (totals[e.unit!] ?? 0) + e.cost!;
      }
    }

    totals[unit] = (totals[unit] ?? 0) + cost;

    String result =
        'CP: ${totals['CP']}, '
        'SP: ${totals['SP']}, '
        'GP: ${totals['GP']}, '
        'PP: ${totals['PP']}';


    totalWeight = weight + accumulatedWeight;
    totalCost = result;
  }

  GroupItem.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    description = data['description'];
    cost = double.parse(data['cost']);
    weight = double.parse(data['weight']);
    unit = data['unit'];
    storageCapacity = double.parse(data['storageCapacity']);

    if (data['items'] != []) {
      data['items'].forEach((e) {
        items.add(Item.fromJSON(e));
      });

    }

    double accumulatedWeight = 0;

    Map<String, double> totals = {
      'CP': 0,
      'SP': 0,
      'GP': 0,
      'PP': 0,
    };


    for (var e in items) {
      if (e.weight != null){
        accumulatedWeight = accumulatedWeight + e.weight!;
      }

      if (e.cost != null && e.unit != null) {
        totals[e.unit!] = (totals[e.unit!] ?? 0) + e.cost!;
      }
    }

    totals[unit] = (totals[unit] ?? 0) + cost;

    String result =
        'CP: ${totals['CP']}, '
        'SP: ${totals['SP']}, '
        'GP: ${totals['GP']}, '
        'PP: ${totals['PP']}';


    totalWeight = weight + accumulatedWeight;
    totalCost = result;
  }

}

