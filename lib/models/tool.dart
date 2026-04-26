
class Tool {
  String? name;
  String? stat;
  List<String>? purpose;
  List<String>? products;
  int? weight;
  int? cost;

  Tool.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    stat = data['stat'];
    purpose = data['purpose'];
    products = data['products'];
    weight = data['weight'];
    cost = data['cost'];
  }


}