import 'package:flutter/material.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/presentation/pages/call_screen.dart';
import 'package:whats_app/presentation/pages/home.dart';
import 'package:whats_app/presentation/pages/setting_screen.dart';
import 'package:whats_app/presentation/pages/status_page.dart';
import 'package:whats_app/presentation/widgets/bottombar.dart';

class PagesState extends StatefulWidget {
  final String phoneNumber;
  const PagesState({super.key, required this.phoneNumber});

  @override
  State<PagesState> createState() => _PagesStateState();
}

class _PagesStateState extends State<PagesState> {
  int _selectedIndex = 0;

  void _onTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      HomePage(
        phoneNumber: widget.phoneNumber,
      ),
      const StoryPage(),
      const CallPage(),
      const SettingPage(),
    ];
    return Scaffold(
      body: pages[_selectedIndex],
      bottomNavigationBar: CustomBottomAppBar(
        onTabSelected: _onTap,
        backgroundColor: AppColors.white,
        selectedColor: AppColors.selectedIcon,
        items: [
          CustomBottomAppBarItem(
              image: Image.asset("images/chat.png"),
              activeimage: Image.asset("images/clicked_chat.png")),
          CustomBottomAppBarItem(
              image: Image.asset("images/Story.png"),
              activeimage: Image.asset("images/activated_story.png")),
          CustomBottomAppBarItem(
              image: Image.asset("images/call.png"),
              activeimage: Image.asset("images/clicked_call.png")),
          CustomBottomAppBarItem(
              image: Image.asset("images/settings.png"),
              activeimage: Image.asset("images/clicked_settings.png")),
        ],
      ),
    );
  }
}
