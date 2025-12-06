

class DndClass {
  String? name;
  int? hitDice;
  List<String>? features;
  List<String>? savingThrows;
  List<String>? primaryAbilities;
  List<String>? skillProficiencies;
  List<String>? weaponProficiencies;

  bool spellcaster = false;

  List<Subclass>? subclasses;


}



class Subclass {
  String name;

  Map<String, dynamic>? features;


  Subclass(this.name);
}