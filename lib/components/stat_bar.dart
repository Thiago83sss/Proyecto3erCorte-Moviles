import 'package:flutter/material.dart';

class StatBar extends StatelessWidget {
  final String label;
  final int value;
  final Color color;

  const StatBar(
      {super.key,
      required this.label,
      required this.value,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        children: [
          SizedBox(
              width: 90,
              child: Text(label, style: const TextStyle(fontSize: 12))),
          SizedBox(
            width: 36,
            child: Text('$value',
                style: const TextStyle(fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(6),
              child: LinearProgressIndicator(
                value: (value / 255).clamp(0.0, 1.0).toDouble(),
                minHeight: 8,
                color: color,
                backgroundColor: Colors.black12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}