import 'package:flutter/material.dart';
import 'package:whats_app/const/list_setting.dart';
import 'package:whats_app/core/constants/AppColor.dart';

class SettingList extends StatelessWidget {
  const SettingList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: settings.length,
        itemBuilder: (context, index) {
          final setting = settings[index];
          return _buildSettingsTile(
            context,
            title: setting["title"] as String,
            subtitle: setting["subtitle"] as String?,
            icon: setting["icon"] as IconData,
            onTap: () => setting["onTap"](context),
          );
        },
      ),
    );
  }
}

Widget _buildSettingsTile(
  BuildContext context, {
  required String title,
  String? subtitle,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return ListTile(
    leading: Icon(icon, color: AppColors.logo),
    title: Text(
      title,
      style: const TextStyle(fontWeight: FontWeight.bold),
    ),
    subtitle: subtitle != null ? Text(subtitle) : null,
    onTap: onTap,
  );
}
