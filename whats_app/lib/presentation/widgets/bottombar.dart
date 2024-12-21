import 'package:flutter/material.dart';

class CustomBottomAppBarItem {
  CustomBottomAppBarItem({required this.image, required this.activeimage});
  Image image;
  Image activeimage;
  String text = '';
}

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    super.key,
    required this.items,
    required this.backgroundColor,
    required this.selectedColor,
    required this.onTabSelected,
  });

  final List<CustomBottomAppBarItem> items;
  final Color backgroundColor;
  final Color selectedColor;
  final ValueChanged<int> onTabSelected;

  @override
  State<CustomBottomAppBar> createState() => _CustomBottomAppBarState();
}

class _CustomBottomAppBarState extends State<CustomBottomAppBar> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index) {
        widget.onTabSelected(index);
        setState(() {
          currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      backgroundColor: widget.backgroundColor,
      selectedItemColor: widget.selectedColor,
      items: widget.items
          .map((item) => BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(height: 20, child: item.image),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(height: 30, child: item.activeimage),
                ),
                label: item.text,
              ))
          .toList(),
    );
  }
}
