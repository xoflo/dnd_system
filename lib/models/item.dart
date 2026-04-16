
class Item {
  String? name;
  double? weight;
  int? cost;
  int quantity = 1;
  String? description;
  String? unit;

  Item(this.name, this.description, this.cost, this.weight, this.unit);

  Item.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    weight = double.parse(data['weight'].toString() );
    cost = int.parse(data['cost']);
    description = data['description'];
    unit = data['unit'];
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