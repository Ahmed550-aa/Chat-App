import 'package:flutter/material.dart';
import 'package:status_view/status_view.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/core/constants/text_style.dart';
import 'package:whats_app/presentation/pages/story.dart';

class StatusList extends StatefulWidget {
  const StatusList({super.key});

  @override
  _StatusListState createState() => _StatusListState();
}

class _StatusListState extends State<StatusList> {
  List<bool> seenStatuses = [];
  @override
  void initState() {
    super.initState();
    seenStatuses = List.generate(2, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: seenStatuses.length,
        itemBuilder: (context, i) {
          return InkWell(
            onTap: () {
              setState(() {
                seenStatuses[i] = true;
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Story()),
              );
            },
            child: ListTile(
              leading: StatusView(
                centerImageUrl: imag,
                seenColor: Colors.grey,
                unSeenColor: AppColors.logo,
                radius: 30,
                spacing: 15,
                strokeWidth: 2,
                indexOfSeenStatus: seenStatuses[i] ? 2 : -1,
                numberOfStatus: 2,
                padding: 4,
              ),
              title: const Text("Ahmed Badr", style: CustomTextStyles.h2),
              subtitle: const Text(
                "Today, 3:51 PM",
                style: TextStyle(color: Colors.grey),
              ),
            ),
          );
        },
      ),
    );
  }
}
