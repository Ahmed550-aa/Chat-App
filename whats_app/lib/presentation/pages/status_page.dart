import 'package:flutter/material.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/presentation/widgets/Status_list.dart';
import 'package:whats_app/core/constants/text_style.dart';
import 'package:whats_app/presentation/widgets/add_status.dart';

class StoryPage extends StatelessWidget {
  const StoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.logo,
          onPressed: () {},
          child: const Icon(Icons.add_a_photo_rounded, color: Colors.white)),
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Updates", style: CustomTextStyles.h2),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.camera_alt_outlined, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search, color: Colors.black)),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert_outlined, color: Colors.black)),
        ],
      ),
      body: const Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Status", style: CustomTextStyles.h3),
            AddStatus(),
            SizedBox(height: 20),
            Text("Recent updates", style: CustomTextStyles.h3),
            StatusList(),
          ],
        ),
      ),
    );
  }
}
