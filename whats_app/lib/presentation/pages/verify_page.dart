import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';
import 'package:whats_app/logic/cubit/phone_auth_cubit.dart';
import 'package:whats_app/presentation/widgets/progressindicator.dart';

class VerifyPage extends StatefulWidget {
  final String phoneNumber;
  const VerifyPage({super.key, required this.phoneNumber});

  @override
  State<VerifyPage> createState() => _VerifyPage();
}

class _VerifyPage extends State<VerifyPage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (index) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (index) => FocusNode());

  String _getOtpCode() {
    return _controllers.map((controller) => controller.text).join();
  }

  bool _isOtpComplete() {
    return _controllers.every((controller) => controller.text.isNotEmpty);
  }

  Widget _buildOtpField(int index) {
    return Container(
      width: 50,
      height: 50,
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) {
          if (value.isNotEmpty) {
            if (index < _controllers.length - 1) {
              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
            }
          } else if (index > 0) {
            FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
          }
          setState(() {});
        },
      ),
    );
  }

  Widget _buildSubmitPhoneNumber(String phoneNumber) {
    return BlocListener<PhoneAuthCubit, PhoneAuthState>(
      listenWhen: (previous, current) => previous != current,
      listener: (context, state) {
        if (state is PhoneAuthLoading) {
          showProgressIndicator(context);
        } else if (state is submitphonenumber) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
            context,
            mainscreen,
            arguments: phoneNumber,
          );
        } else if (state is PhoneAuthFailed) {
          Navigator.pop(context);
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(widget.phoneNumber + "wioeudfheidfhdi");
    // String phoneNumber = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.logo,
        title: const Text('Enter OTP Code'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 50),
            Text(
              'Code has been sent to $widget.phoneNumber',
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return _buildOtpField(index);
              }),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isOtpComplete()
                  ? () {
                      final otpCode = _getOtpCode();
                      BlocProvider.of<PhoneAuthCubit>(context)
                          .submitOTP(otpCode);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: _isOtpComplete() ? Colors.blue : Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text(
                'Verify',
                style: TextStyle(color: Colors.white),
              ),
            ),
            _buildSubmitPhoneNumber(widget.phoneNumber),
          ],
        ),
      ),
    );
  }
}
