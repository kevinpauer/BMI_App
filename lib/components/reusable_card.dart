import 'package:flutter/material.dart';

class ContainerWindow extends StatelessWidget {
  ContainerWindow(
      {Key? key, required this.color, this.cardChild, this.setNewGender})
      : super(key: key);

  final Color color;
  final Widget? cardChild;
  final Function? setNewGender;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setNewGender!();
      },
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
        ),
      ),
    );
  }
}
