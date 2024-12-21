
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:whats_app/core/constants/AppColor.dart';

// ignore: must_be_immutable
class CountriesCode extends StatelessWidget {
  CountriesCode({
    super.key,
    required this.onsubmitted,
  });

  void Function (String )onsubmitted;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      onSubmitted: onsubmitted,
      initialCountryCode: 'EG',
      decoration: const InputDecoration(
        labelText: ' Phone Number',
        labelStyle: TextStyle(color: AppColors.grey, fontSize: 15,),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.logo,
            width: 2.5,
          )
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.logo,
            width: 2.5,
          )
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
          color: AppColors.red,
          width: 1.5,
          )
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
          color: AppColors.red,
          width: 1.5,
          )
        )
      ),
      onChanged: (value) {
        
      },
    );
  }
}