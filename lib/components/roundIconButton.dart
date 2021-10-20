import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  const RoundIconButton({Key? key, required this.icon, required this.onPressed})
      : super(key: key);

  final IconData icon;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      elevation: 2,
      constraints: BoxConstraints.tightFor(
        width: 42,
        height: 42,
      ),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
      onPressed: () {
        onPressed();
      },
    );
  }
}
