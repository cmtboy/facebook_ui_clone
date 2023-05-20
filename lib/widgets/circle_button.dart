import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CircleButton extends StatelessWidget {
  const CircleButton(
      {super.key,
      required this.icon,
      required this.onpress,
      required this.size});

  final Icon icon;
  final VoidCallback onpress;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(6),
      child: CircleAvatar(
        backgroundColor: Colors.grey[200],
        child: IconButton(
          icon: icon,
          onPressed: onpress,
          iconSize: size,
        ),
      ),
    );
  }
}
