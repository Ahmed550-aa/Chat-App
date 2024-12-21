import 'package:flutter/material.dart';
import 'package:story_view/controller/story_controller.dart';
import 'package:story_view/widgets/story_view.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';

class Story extends StatelessWidget {
  const Story({super.key});

  @override
  Widget build(BuildContext context) {
    StoryController controller = StoryController();

    List<StoryItem?> storyItems = [
      StoryItem.text(
        title: story,
        textStyle: const TextStyle(
          fontSize: 24,
          decoration: TextDecoration.none,
        ),
        backgroundColor: AppColors.logo,
      ),
      StoryItem.pageImage(url: imag, controller: controller),
    ];

    return StoryView(
      storyItems: storyItems,
      controller: controller,
      onComplete: () {
        Navigator.pop(context);
      },
    );
  }
}
