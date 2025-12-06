
import 'package:flutter/material.dart';

class SkillSelector extends StatefulWidget {
  SkillSelector({required this.skills, required this.skillDesc});

  List<String> skills;
  String skillDesc;

  @override
  State<SkillSelector> createState() => _SkillSelectorState();
}

class _SkillSelectorState extends State<SkillSelector> {

  List<String> allSkills = [
    'Athletics',
    'Acrobatics',
    'Sleight of Hand',
    'Stealth',
    'Arcana',
    'History',
    'Investigation',
    'Nature',
    'Religion',
    'Animal Handling',
    'Insight',
    'Medicine',
    'Perception',
    'Survival',
    'Deception',
    'Intimidation',
    'Performance',
    'Persuasion'
  ];



  @override
  Widget build(BuildContext context) {
    return skillSelector();
  }

  skillSelector() {
    return Container(
      height: 500,
      width: 400,
      child: StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return Column(
            children: [
              Container(
                height: 400,
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                    itemCount: allSkills.length,
                    itemBuilder: (context, i) {
                      return
                        tappableCard(allSkills[i]);
                    }),
              ),
              SizedBox(height: 10),
              Text("${widget.skillDesc}: ${widget.skills.toString().replaceAll("[", "").replaceAll("]", "")}", textAlign: TextAlign.center,)
            ],
          );
        },
      ),
    );
  }

  tappableCard(String content) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return InkWell(
          onTap: () {
            if (widget.skills.contains(content))  {
              widget.skills.remove(content);
            } else {
              widget.skills.add(content);
            }

            this.setState((){});
          },
          child: Container(
            height: 60,
            width: 60,
            child: Card(
              color: widget.skills.contains(content) ? Colors.red : Colors.white,
              child: Center(child: Text(content, textAlign: TextAlign.center)),

            ),
          ),
        );
      },
    );
  }
}
