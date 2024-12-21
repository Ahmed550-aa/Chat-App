
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whats_app/core/constants/AppColor.dart';

// ignore: must_be_immutable
class SendBar extends StatelessWidget {
  const SendBar({super.key, this.onSend});

  final void Function(String)? onSend;

  @override
  Widget build(BuildContext context) {
    return MessageBar(
      onSend: onSend,
      actions: [
        InkWell(
          child: const Icon(
            Icons.add,
            color: AppColors.black,
            size: 24,
          ),
          onTap: () {
            _handleAddMedia(context);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: InkWell(
            child: const Icon(
              Icons.mic,
              color: AppColors.logo,
              size: 24,
            ),
            onTap: () {},
          ),
        ),
      ],
    );
  }
}

void _handleAddMedia(BuildContext context) async {
  final ImagePicker picker = ImagePicker();
  await showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            leading: const Icon(Icons.image),
            title: const Text('Select Image'),
            onTap: () async {
              print('hkgkffgfgfgfg');
              final XFile? image =
                  await picker.pickImage(source: ImageSource.gallery);
              if (image != null) {
                print('Image Path: ${image.path}');
              }
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.videocam),
            title: const Text('Select Video'),
            onTap: () async {
              final XFile? video =
                  await picker.pickVideo(source: ImageSource.gallery);
              if (video != null) {
                print('Video Path: ${video.path}');
              }
              Navigator.pop(context);
            },
          ),
        ],
      );
    },
  );
}


// await showModalBottomSheet(
//                 context: context,
//                 builder: (context) {
//                   return Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       ListTile(
//                         leading: const Icon(Icons.image),
//                         title: const Text('Select Image'),
//                         onTap: () async {
//                           final XFile? image = await picker.pickImage(
//                             source: ImageSource.gallery,
//                           );
//                           if (image != null) {
//                             print('Image Path: ${image.path}');
//                           }
//                           Navigator.pop(context);
//                         },
//                       ),
//                       ListTile(
//                         leading: const Icon(Icons.videocam),
//                         title: const Text('Select Video'),
//                         onTap: () async {
//                           print('beforee');
//                           final XFile? video = await picker.pickVideo(
//                             source: ImageSource.gallery,
//                           );
//                           print('afterrr');
//                           if (video != null) {
//                             print('Video Path: ${video.path}');
//                           }
//                           Navigator.pop(context);
//                         },
//                       ),
//                     ],
//                   );
//                 })