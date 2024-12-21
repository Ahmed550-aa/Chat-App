import 'package:flutter/material.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/core/constants/text_style.dart';

import 'bottomsheet_custom.dart';

class AddStatus extends StatelessWidget {
  const AddStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        bottomSheetCustom(context);
      },
      child: ListTile(
        leading: Stack(children: [
          Container(
              width: 50,
              height: 50,
              decoration: const BoxDecoration(
                color: AppColors.logo,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 40,
              )),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                color: Colors.grey,
                shape: BoxShape.circle,
              ),
              child:
                  const Icon(Icons.add_outlined, size: 20, color: Colors.white),
            ),
          ),
        ]),
        title: const Text("My Status", style: CustomTextStyles.h2),
        subtitle: const Text("Tap to add status update"),
        subtitleTextStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
