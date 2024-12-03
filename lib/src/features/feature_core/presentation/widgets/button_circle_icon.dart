import 'package:flutter/material.dart';

class ButtonCircleIcon extends StatelessWidget {
  final Icon icon;
  final Color backgroundColor;
  final Function onPressed;

  const ButtonCircleIcon({super.key,
    required this.icon,
    required this.backgroundColor,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(8),
      ),
      child: icon);
  }
}