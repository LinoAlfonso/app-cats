import 'package:flutter/material.dart';

class CountryCat extends StatelessWidget {
  final String? country;
  final Color colorIcon;
  final TextStyle textStyle;

  const CountryCat({super.key,
    required this.country,
    required this.colorIcon,
    required this.textStyle});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.location_on, color: colorIcon),
        const SizedBox(width: 8),
        Text(country ?? '', style: textStyle),
      ],
    );
  }
}