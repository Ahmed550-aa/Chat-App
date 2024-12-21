import 'package:flutter/material.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/core/constants/AppColor.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, registerScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar:AppBar(
        backgroundColor: AppColors.logo,
      ) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2,),
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                // color: AppColors.logo
              ),
              child: Image.asset("images/splash.gif")
            ),
            const Spacer(flex: 1,),
            const Text(
              'F l a s h',
              style: TextStyle(
                fontFamily: 'Nerko One',
                fontSize: 45,
                color: AppColors.logo
              ),
              ),
              const Spacer(flex: 3,),
            ],
          ),
        )
      );
  }
}