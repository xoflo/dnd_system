
class Item {
  String? name;
  double? weight;
  int? cost;
  String? description;
  String? unit;

  Item(this.name, this.description, this.cost, this.weight, this.unit);

  Item.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    weight = data['weight'];
    cost = data['cost'];
    description = data['description'];
    description = data['unit'];
  }

  toJSON() {
    return {
      'name': name,
      'weight': weight,
      'cost': cost,
      'description': description,
      'unit': unit,
    };
  }

}