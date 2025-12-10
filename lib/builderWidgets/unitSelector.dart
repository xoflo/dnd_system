import 'package:flutter/material.dart';

class UnitSelector extends StatefulWidget {
  UnitSelector({required this.unit});

  String unit;

  @override
  State<UnitSelector> createState() => _UnitSelectorState();
}

class _UnitSelectorState extends State<UnitSelector> {
  @override
  Widget build(BuildContext context) {
    return unitSelector();
  }

  unitSelector() {
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
                    tappableCard("CP"),
                    tappableCard("SP"),
                    tappableCard("GP"),
                    tappableCard("PP"),
                  ]
              ),
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
            widget.unit = content;
            this.setState((){});
          },
          child: Container(
            height: 60,
            width: 60,
            child: Card(
              color: widget.unit == content ? Colors.red : Colors.white,
              child: Center(child: Text(content.toString())),

            ),
          ),
        );
      },
    );
  }

}



