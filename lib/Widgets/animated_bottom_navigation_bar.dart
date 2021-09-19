import 'package:animated_bottom_nav_bar/Models/animated_vav_bar_tem.dart';
import 'package:animated_bottom_nav_bar/Utils/constants.dart';
import 'package:animated_bottom_nav_bar/Widgets/animated_bottom_nav_bar_item.dart';
import 'package:flutter/material.dart';

class AnimatedBottomNavigationBar extends StatelessWidget {
  AnimatedBottomNavigationBar({
    Key? key,
    this.elevation = 3,
    this.height = 75,
    this.backGroundColor,
    this.shadowColor = Colors.black12,
    inactiveColor,
    required this.items,
    required this.onItemSelected,
    this.currentIndex = 0,
  })  : inactiveColor = Colors.grey[400]!,
        assert(
          height <= 100,
          "Height can't be greater 100",
        ),
        assert(
          items.isNotEmpty,
          "Items inside AnimatedBottomNavigationBar can't be empty",
        ),
        assert(
          items.length > 1,
          "Items length must be > 1 for AnimatedBottomNavigationBar",
        ),
        assert(
          items.toSet().length == items.length,
          "Navigation bar can't have duplicate items",
        ),
        super(key: key);

  final double elevation;
  final int height;
  final Color? backGroundColor;
  final Color inactiveColor;
  final Color shadowColor;
  final List<AnimatedNavBarItem> items;
  final OnItemSelected onItemSelected;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: backGroundColor ?? Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: elevation,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: items.length <= 2
              ? MainAxisAlignment.center
              : MainAxisAlignment.spaceEvenly,
          children: items.map((item) {
            var currentItemIndex = items.indexOf(item);
            return GestureDetector(
              onTap: () {
                onItemSelected(currentItemIndex);
              },
              child: AnimatedBottomNavBarItems(
                needMargin: items.length <= 2,
                isSelected: currentIndex == currentItemIndex,
                activeColor: item.color,
                label: item.label,
                icon: item.icon,
                index: currentItemIndex,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
