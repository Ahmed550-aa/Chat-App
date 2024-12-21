import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';

// ignore: must_be_immutable
class Contact extends StatelessWidget {
  Contact({super.key, required this.profilePicture, required this.name});

  final String profilePicture;
  final String name;
  final CollectionReference messages =
      FirebaseFirestore.instance.collection(keyMessagesCollection);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 25,
          backgroundImage: AssetImage("images/a.jpg"),
          backgroundColor: Colors.grey.shade300,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name.isNotEmpty ? name : "Unknown User",
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
              ),
              StreamBuilder<QuerySnapshot>(
                stream: messages.orderBy('createdAt').snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
                    final lastMessage = snapshot.data!.docs.last['message'] ?? "";
                    return Text(
                      lastMessage,
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                      overflow: TextOverflow.ellipsis,
                    );
                  } else if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text(
                      'Loading...',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    );
                  } else {
                    return const Text(
                      'No messages yet',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    );
                  }
                },
              ),
            ],
          ),
        ),
        const Spacer(),
        StreamBuilder<QuerySnapshot>(
          stream: messages.orderBy('createdAt').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
              final timestamp = snapshot.data!.docs.last['createdAt'] as Timestamp;
              final dateTime = timestamp.toDate();
              return Text(
                TimeFormatter.format(dateTime),
                style: const TextStyle(
                  color: AppColors.logo,
                  fontWeight: FontWeight.w700,
                ),
              );
            } else {
              return const Text('');
            }
          },
        ),
      ],
    );
  }
}

class TimeFormatter {
  static String format(DateTime dateTime) {
    int hour = dateTime.hour;
    int minute = dateTime.minute;

    String period = hour >= 12 ? 'PM' : 'AM';
    int formattedHour = hour == 0
        ? 12
        : hour > 12
            ? hour - 12
            : hour;

    String formattedMinute = minute.toString().padLeft(2, '0');
    return '$formattedHour:$formattedMinute $period';
  }

  static String formatFromTimestamp(Timestamp timestamp) {
    DateTime dateTime = timestamp.toDate();
    return format(dateTime);
  }
}
