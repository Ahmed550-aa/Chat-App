import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whats_app/const/recent_call_data.dart';
import 'package:whats_app/core/constants/text_style.dart';

class RecentCallList extends StatefulWidget {
  const RecentCallList({super.key});

  @override
  State<RecentCallList> createState() => _RecentCallListState();
}

class _RecentCallListState extends State<RecentCallList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: recentcall.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(recentcall[i]['image']),
                  radius: 23,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(recentcall[i]['name'], style: CustomTextStyles.h3),
                      Text(
                        recentcall[i]['date'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    if (recentcall[i]['phone'] != null &&
                        recentcall[i]['phone'].isNotEmpty) {
                      final Uri url =
                          Uri(scheme: 'tel', path: recentcall[i]['phone']);
                      await launchUrl(url);
                    }
                  },
                  icon: IconButton(
                      onPressed: () async {
                        // setState(() {
                        //   addCall(i);
                        // });
                        if (recentcall[i]['phone'] != null &&
                            recentcall[i]['phone'].isNotEmpty) {
                          final Uri url =
                              Uri(scheme: 'tel', path: recentcall[i]['phone']);
                          await launchUrl(url);
                        }
                      },
                      icon: const Icon(Icons.call)),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
