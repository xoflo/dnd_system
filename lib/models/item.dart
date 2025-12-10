
class Item {
  String? name;
  int? weight;
  int? cost;
  String? description;

  Item();

  Item.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    weight = data['weight'];
    cost = data['cost'];
    description = data['description'];
  }

  toJSON() {
    return {
      'name': name,
      'weight': weight,
      'cost': cost,
      'description': description,
    };
  }

}