import 'package:flutter/material.dart';
import 'package:whats_app/core/constants/AppColor.dart';

class FilterMessage extends StatelessWidget {
  const FilterMessage({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: AppColors.lightApp,
          foregroundColor: AppColors.black),
      child: Text(text),
    );
  }
}
