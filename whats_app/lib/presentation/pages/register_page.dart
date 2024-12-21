import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/logic/cubit/phone_auth_cubit.dart';
import 'package:whats_app/presentation/widgets/countries_codes.dart';
import 'package:whats_app/presentation/widgets/progressindicator.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisrerPageState();
}

class _RegisrerPageState extends State<RegisterPage> {
  String? phone;

  Widget buildSubmitPhoneNumber() {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        } else if (state is submitphonenumber) {
          Navigator.pop(context);
          Navigator.pushNamed(
            context,
            verificationscreen,
            arguments: phone,
          );
        } else if (state is PhoneAuthFailed) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: Container(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.logo,
        title: const Text(
          'Enter your phone number',
          style: TextStyle(color: AppColors.white, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CountriesCode(
              onsubmitted: (val) {
                phone = val;
              },
            ),
            ElevatedButton(
                onPressed: () {
                  BlocProvider.of<PhoneAuthCubit>(context).submitPhoneNumber(phone!);
                  buildSubmitPhoneNumber();
                },
                style: ElevatedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    backgroundColor: AppColors.logo,
                    minimumSize: const Size(150, 50)),
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
                )
              ),
            buildSubmitPhoneNumber(),
          ],
        ),
      ),
    );
  }
}