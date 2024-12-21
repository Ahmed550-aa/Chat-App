import 'package:flutter/material.dart';

class CustomSearchBar extends StatelessWidget implements PreferredSizeWidget {
  final TextEditingController controller;
  final bool isSearching;
  final VoidCallback onClear;
  final VoidCallback onSearch;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.isSearching,
    required this.onClear,
    required this.onSearch,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: isSearching ? const BackButton() : Container(),
      title: isSearching
          ? TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Find a contact...',
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 18),
              ),
              style: const TextStyle(fontSize: 18),
            )
          : const Text('', style: TextStyle()),
      actions: [
        IconButton(
          onPressed: isSearching ? onClear : onSearch,
          icon: Icon(
            isSearching ? Icons.clear : Icons.search,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
