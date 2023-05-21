import 'package:flutter/material.dart';

class CreateRoomButton extends StatelessWidget {
  const CreateRoomButton({super.key, required this.onpress});
  final VoidCallback onpress;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          border: Border.all(width: 2, color: Colors.purple)),
      child: TextButton.icon(
        label: const Text(
          'Create\nRoom',
          style: TextStyle(fontSize: 10),
        ),
        onPressed: onpress,
        icon: const Icon(
          Icons.video_call,
          color: Colors.purpleAccent,
        ),
      ),
    );
  }
}
