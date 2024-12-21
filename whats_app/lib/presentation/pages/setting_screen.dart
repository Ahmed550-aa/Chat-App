import 'package:flutter/material.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/presentation/widgets/setting_list.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: AppColors.logo,
        title: const Text('Setting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            ListTile(
              leading: const CircleAvatar(radius: 50),
              title: const Text(
                'Ahmed Zamzam',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle:
                  const Text('The sleep and my heart to what I wake up to'),
              onTap: () {},
            ),
            const Divider(
                color: Color.fromARGB(255, 202, 197, 197), thickness: .5),
            const SettingList()
          ],
        ),
      ),
    );
  }
}
