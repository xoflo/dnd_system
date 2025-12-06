import 'package:flutter/material.dart';

class WeaponSelector extends StatefulWidget {
  WeaponSelector({required this.weapon});

  List<String> weapon;

  @override
  State<WeaponSelector> createState() => _WeaponSelectorState();
}

class _WeaponSelectorState extends State<WeaponSelector> {
  @override
  Widget build(BuildContext context) {
    return statSelector();
  }

  statSelector() {
    return Container(
      height: 120,
      width: 400,
      child: StatefulBuilder(
        builder: (BuildContext context, void Function(void Function()) setState) {
          return Column(
            children: [
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    tappableCard("Simple"),
                    tappableCard("Martial"),

                  ]
              ),
              SizedBox(height: 10),
              Text("Weapon Proficiencies: ${widget.weapon.toString().replaceAll("[", "").replaceAll("]", "")}")
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
            if (widget.weapon.contains(content))  {
              widget.weapon.remove(content);
            } else {
              widget.weapon.add(content);
            }

            this.setState((){});
          },
          child: Container(
            height: 60,
            width: 60,
            child: Card(
              color: widget.weapon.contains(content) ? Colors.red : Colors.white,
              child: Center(child: Text(content)),

            ),
          ),
        );
      },
    );
  }

}



