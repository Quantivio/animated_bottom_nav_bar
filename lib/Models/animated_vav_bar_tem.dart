import 'package:flutter/material.dart';

class AnimatedNavBarItem {
  const AnimatedNavBarItem({
    required this.label,
    required this.icon,
    this.color,
  });

  final String label;
  final IconData icon;
  final Color? color;
}
