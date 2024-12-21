import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:whats_app/core/constants/AppColor.dart';

File? images;
void bottomSheetCustom(BuildContext context) {
  final ImagePicker picker = ImagePicker();

  showModalBottomSheet(
    backgroundColor: AppColors.white,
    context: context,
    isScrollControlled: true,
    builder: (BuildContext ctx) {
      return SizedBox(
        height: 170,
        width: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 219, 218, 218)),
                ),
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  XFile? pickedFile =
                      await picker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    images = File(pickedFile.path); // Convert XFile to File
                  } else {
                    images = null; // Handle the case when no file is selected
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Icon(Icons.photo_sharp, color: AppColors.logo),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 219, 218, 218)),
                ),
                onPressed: () async {
                  final XFile? image =
                      await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {}
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: AppColors.logo,
                  ),
                ),
              ),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 219, 218, 218)),
                ),
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Icon(
                    Icons.text_fields,
                    color: AppColors.logo,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
