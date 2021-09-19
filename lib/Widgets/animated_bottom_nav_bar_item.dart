import 'package:animated_bottom_nav_bar/Utils/constants.dart';
import 'package:flutter/material.dart';

class AnimatedBottomNavBarItems extends StatelessWidget {
  AnimatedBottomNavBarItems({
    Key? key,
    required this.isSelected,
    required this.label,
    required this.icon,
    this.activeColor = Colors.blue,
    required this.needMargin,
    required this.index,
    this.navBarItemAlignment = NavBarItemAlignment.center,
  }) : super(key: key);

  final bool isSelected;
  final bool needMargin;
  final String? label;
  final IconData? icon;
  final Color? activeColor;
  final int index;
  final NavBarItemAlignment navBarItemAlignment;

  final Map<NavBarItemAlignment, Alignment> _alignmentGetter = {
    NavBarItemAlignment.center: Alignment.center,
    NavBarItemAlignment.left: Alignment.centerLeft,
    NavBarItemAlignment.right: Alignment.centerRight,
  };

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: 60,
      width: isSelected ? 130 : 55,
      padding: isSelected ? hPad12 : zeroPad,
      margin:
          needMargin && index == 1 ? const EdgeInsets.only(left: 30) : zeroPad,
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        color: isSelected ? activeColor!.withOpacity(0.2) : null,
        borderRadius: BorderRadius.circular(15),
      ),
      curve: Curves.linearToEaseOut,
      child: Align(
        alignment: isSelected
            ? _alignmentGetter[navBarItemAlignment]!
            : Alignment.center,
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? activeColor : Colors.grey[400],
              ),
              if (isSelected) ...[
                const SizedBox(
                  width: 10,
                ),
                DefaultTextStyle.merge(
                  style: TextStyle(
                    color: activeColor,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  child: Text(label!),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
