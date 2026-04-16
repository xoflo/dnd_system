
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
    weight = data['weight'].toString() == "" ? 0 : double.parse(data['weight'].toString() );
    cost = int.parse(data['cost'].toString());
    description = data['description'];
    unit = data['unit'];
    quantity = data['quantity'] ?? 1;
  }

  toJSON() {
    return {
      'name': name,
      'weight': weight,
      'cost': cost,
      'description': description,
      'unit': unit,
      'quantity': quantity,
    };
  }

}