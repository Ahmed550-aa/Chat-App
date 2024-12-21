import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whats_app/const/data.dart';
import 'package:whats_app/core/constants/text_style.dart';
import 'package:whats_app/core/functions/add_call.dart';

class CallList extends StatefulWidget {
  const CallList({super.key});

  @override
  State<CallList> createState() => _CallListState();
}

class _CallListState extends State<CallList> {
 

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: data.length,
        itemBuilder: (BuildContext context, int i) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage("images/a.jpg"),
                  radius: 23,
                ),
                const SizedBox(width: 20),
                Expanded(
                  child: Text(data[i]['name'], style: CustomTextStyles.h3),
                ),
                IconButton(
                  onPressed: () async {
                    setState(() {
                      addCall(i);
                    });
                    if (data[i]['phone'] != null &&
                        data[i]['phone'].isNotEmpty) {
                      final Uri url =
                          Uri(scheme: 'tel', path: data[i]['phone']);
                      await launchUrl(url);
                    }
                  },
                  icon: const Icon(Icons.call),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
