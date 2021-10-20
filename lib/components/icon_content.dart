import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    Key? key,
    required this.iconType,
    required this.gender,
  }) : super(key: key);

  final IconData iconType;
  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconType,
          size: 80,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          gender,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
