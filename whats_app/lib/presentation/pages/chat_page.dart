import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/data/message_model.dart';
import 'package:whats_app/presentation/widgets/chat_bubble.dart';
import 'package:whats_app/presentation/widgets/send_bar.dart';

// ignore: must_be_immutable
class ChatPage extends StatelessWidget {
  String name;
  String img;
  String phoneNumber;
  ChatPage(
      {super.key,
      required this.name,
       required this.img,
      required this.phoneNumber});

  CollectionReference messages =
      FirebaseFirestore.instance.collection(keyMessagesCollection);

  final controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    print(name);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.grey,
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: Row(
          children: [
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back)),
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  img,
                  width: 40,
                  fit: BoxFit.fill,
                )),
            const SizedBox(
              width: 8,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Column(children: [
        Expanded(
          child: StreamBuilder(
              stream:
                  messages.orderBy('createdAt', descending: true).snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasData) {
                  List<Message> messages =
                      Message.fromFirebase(snapshot.data!.docs);
                  return ListView.builder(
                    reverse: true,
                    controller: controller,
                    itemCount: messages.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        message: messages[index].value,
                        color: messages[index].id == phoneNumber
                            ? AppColors.logo
                            : AppColors.grey,
                        isSender:
                            messages[index].id == phoneNumber ? true : false,
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.logo,
                    ),
                  );
                }
              }),
        ),
        SendBar(
          onSend: (data) {
            messages.add({
              'message': data,
              'createdAt': DateTime.now(),
              'id': phoneNumber,
            });
            controller.animateTo(
              0,
              duration: const Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
            );
          },
        ),
      ]),
    );
  }
}
