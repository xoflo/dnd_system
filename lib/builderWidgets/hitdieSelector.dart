import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class HitDieSelector extends StatefulWidget {
  HitDieSelector({required this.hitdie});

  int hitdie;

  @override
  State<HitDieSelector> createState() => _HitDieSelectorState();
}

class _HitDieSelectorState extends State<HitDieSelector> {
  @override
  Widget build(BuildContext context) {
    return hitdieSelector();
  }

  hitdieSelector() {
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
                    tappableCard(6),
                    tappableCard(8),
                    tappableCard(10),
                    tappableCard(12),
                  ]
              ),
              SizedBox(height: 10),
              Text("Hit Die: d${widget.hitdie}")
            ],
          );
        },
      ),
    );
  }

  tappableCard(int content) {
    return StatefulBuilder(
      builder: (BuildContext context, void Function(void Function()) setState) {
        return InkWell(
          onTap: () {
            widget.hitdie = content;
            this.setState((){});
          },
          child: Container(
            height: 60,
            width: 60,
            child: Card(
              color: widget.hitdie == content ? Colors.red : Colors.white,
              child: Center(child: Text(content.toString())),

            ),
          ),
        );
      },
    );
  }

}



