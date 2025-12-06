import 'package:flutter/material.dart';

class ArmorSelector extends StatefulWidget {
  ArmorSelector({required this.armor});

  List<String> armor;

  @override
  State<ArmorSelector> createState() => _ArmorSelectorState();
}

class _ArmorSelectorState extends State<ArmorSelector> {
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
                    tappableCard("Light"),
                    tappableCard("Medium"),
                    tappableCard("Heavy"),
                    tappableCard("Shields"),
                  ]
              ),
              SizedBox(height: 10),
              Text("Armor Proficiencies: ${widget.armor.toString().replaceAll("[", "").replaceAll("]", "")}")
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
            if (widget.armor.contains(content))  {
              widget.armor.remove(content);
            } else {
              widget.armor.add(content);
            }

            this.setState((){});
          },
          child: Container(
            height: 60,
            width: 60,
            child: Card(
              color: widget.armor.contains(content) ? Colors.red : Colors.white,
              child: Center(child: Text(content)),

            ),
          ),
        );
      },
    );
  }

}



