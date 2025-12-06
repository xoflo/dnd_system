import 'package:dndsystem/builderWidgets/globals.dart';
import 'package:dndsystem/builderWidgets/hitdieSelector.dart';
import 'package:dndsystem/builderWidgets/skillSelector.dart';
import 'package:flutter/material.dart';

import '../../builderWidgets/statSelector.dart';

class AddClassScreen extends StatefulWidget {
  const AddClassScreen({super.key});

  @override
  State<AddClassScreen> createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  List<String> primaryAbilities = [];
  List<String> savingThrows = [];
  List<String> skillProficiencies = [];
  int hitdie = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Text("Add Class"),
              Divider(),
              TextField(
                decoration: InputDecoration(
                  hintText: "Class Name"
              )),
              HitDieSelector(hitdie: hitdie),
              StatSelector(stat: primaryAbilities, statDesc: "Primary Abilities"),

              StatSelector(stat: savingThrows, statDesc: "Saving Throws"),
              SkillSelector(skills: skillProficiencies, skillDesc: "Skill Proficiencies")
            ],
          )
        ),
      ),
    );
  }
}
