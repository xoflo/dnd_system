
class Armor {
  String? name;
  int? ac;
  int? strengthRequirement;
  int? weight;
  int? cost;
  bool? nonStealth;
  bool? dexMod;
  int? maxDexMod;


  Armor();


  Armor.fromJSON(Map<String, dynamic> data) {

    name = data['name'];
    ac = data['ac'];
    strengthRequirement = data['strengthRequirement'];
    weight = data['weight'];
    cost = data['cost'];
    nonStealth = data['nonStealth'];
    dexMod = data['dexMod'];
    maxDexMod = data['maxDexMod'];
  }

  toJSON() {
    return {
      'name': name,
      'ac': ac,
      'strengthRequirement': strengthRequirement,
      'weight': weight,
      'cost': cost,
      'nonStealth': nonStealth,
      'dexMod': dexMod,
      'maxDexMod': maxDexMod,
    };
  }

}