part of 'phone_auth_cubit.dart';

@immutable
sealed class PhoneAuthState {}

final class PhoneAuthInitial extends PhoneAuthState {}

final class PhoneAuthSuccess extends PhoneAuthState {}

final class PhoneAuthLoading extends PhoneAuthState {}

// ignore: must_be_immutable
final class PhoneAuthFailed extends PhoneAuthState {
  String error = '';
  PhoneAuthFailed({required String error});
}

final class submitphonenumber extends PhoneAuthState {}

final class PhoneAuthCodeSent extends PhoneAuthState {}
final class PhoneAuthTimeout extends PhoneAuthState {}
