
class Weapon {
  String? name;
  String? damage;
  List<String>? properties;
  String? mastery;
  int? weight;
  int? cost;


  Weapon(this.name, this.damage, this.properties, this.mastery, this.weight, this.cost);


  Weapon.fromJSON(Map<String, dynamic> data) {
    name = data['name'];
    damage = data['damage'];
    properties = data['property'];
    mastery = data['mastery'];
    weight = data['weight'];
    cost = data['cost'];
  }

  toJSON() {
    return {
      'name': name,
      'damage': damage,
      'property': properties,
      'mastery': mastery,
      'weight': weight,
      'cost': cost,
    };
  }

}