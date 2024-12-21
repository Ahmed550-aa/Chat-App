import 'package:flutter/material.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/presentation/widgets/contacts.dart';
import 'package:whats_app/presentation/widgets/filter_messages.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.phoneNumber});

  final String phoneNumber;

  final String image ="images/a.jpg";

  final String name = 'Ahmed Yahia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.logo,
        title: const Text(
          'Chat',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 35,
              child: TextField(
                textAlignVertical: TextAlignVertical.bottom,
                cursorColor: AppColors.black,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      size: 18,
                    ),
                    filled: true,
                    fillColor: AppColors.lightApp,
                    hintText: 'Search',
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: AppColors.black,
                          width: .5,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        borderSide: BorderSide(
                          color: AppColors.black,
                          width: 1,
                        ))),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FilterMessage(text: 'All'),
                FilterMessage(text: 'Unread'),
                FilterMessage(text: 'Favorite'),
                FilterMessage(text: 'Groups'),
              ],
            ),
            const SizedBox(
              height: 12,
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  chatPage,
                  arguments: {
                    'phoneNumber': phoneNumber,
                    'image': image,
                    'name':name,
                  },
                );
              },
              child: Contact(profilePicture: image, name: name),
            ),
          ],
        ),
      ),
    );
  }
}
