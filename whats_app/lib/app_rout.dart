import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_app/const/strings.dart';
import 'package:whats_app/logic/cubit/phone_auth_cubit.dart';
import 'package:whats_app/presentation/pages/chat_page.dart';
import 'package:whats_app/presentation/pages/pages_state.dart';
import 'package:whats_app/presentation/pages/register_page.dart';
import 'package:whats_app/presentation/pages/splash_screen.dart';
import 'package:whats_app/presentation/pages/verify_page.dart';

class AppRouter {
  late final PhoneAuthCubit phoneAuthCubit;

  AppRouter() {
    phoneAuthCubit = PhoneAuthCubit();
  }

  Route? generateRoute(RouteSettings route) {
    switch (route.name) {
      case splashscreen:
        return MaterialPageRoute(
          builder: (_) => const SplashScreen(),
        );

      case registerScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: phoneAuthCubit,
            child: const RegisterPage(),
          ),
        );

      case verificationscreen:
        final phonenumber = route.arguments as String;
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: phoneAuthCubit,
            child: VerifyPage(phoneNumber: phonenumber),
          ),
        );
      case mainscreen:
        final phonenumber = route.arguments as String;
        return MaterialPageRoute(
          builder: (_) => PagesState(phoneNumber: phonenumber),
        );
      case chatPage:
        final arg = route.arguments as Map<String, String>;
        final phonenumber = arg["phoneNumber"] as String;
        final name = arg["name"] as String;
        final im = arg["image"] as String;
        return MaterialPageRoute(
          builder: (_) =>
              ChatPage( name: name, img: im,phoneNumber: phonenumber),
        );
      default:
        return null;
    }
  }
}
