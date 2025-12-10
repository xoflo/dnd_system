
class Tool {
  String? name;
  String? stat;
  List<String>? purpose;
  List<String>? products;
  int? weight;
  int? cost;


  Tool();


  Tool.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    stat = data['stat'];
    purpose = data['purpose'];
    products = data['products'];
    weight = data['weight'];
    cost = data['cost'];
  }

  toJSON() {
    return {
      'name': name,
      'stat': stat,
      'purpose': purpose,
      'products': products,
      'weight': weight,
      'cost': cost,
    };
  }

}