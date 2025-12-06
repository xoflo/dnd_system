import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class StatSelector extends StatefulWidget {
  StatSelector({required this.stat, required this.statDesc});

  List<String> stat;
  String statDesc;

  @override
  State<StatSelector> createState() => _StatSelectorState();
}

class _StatSelectorState extends State<StatSelector> {
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
                    tappableCard("STR"),
                    tappableCard("DEX"),
                    tappableCard("CON"),
                    tappableCard("INT"),
                    tappableCard("WIS"),
                    tappableCard("CHA")
                  ]
              ),
              SizedBox(height: 10),
              Text("${widget.statDesc}: ${widget.stat.toString().replaceAll("[", "").replaceAll("]", "")}")
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
            if (widget.stat.contains(content))  {
              widget.stat.remove(content);
            } else {
              widget.stat.add(content);
            }

            this.setState((){});
          },
          child: Container(
            height: 60,
            width: 60,
            child: Card(
              color: widget.stat.contains(content) ? Colors.red : Colors.white,
              child: Center(child: Text(content)),

            ),
          ),
        );
      },
    );
  }

}



