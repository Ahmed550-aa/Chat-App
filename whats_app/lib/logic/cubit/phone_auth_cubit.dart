import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
part 'phone_auth_state.dart';

class PhoneAuthCubit extends Cubit<PhoneAuthState> {

  late String verificationId;
 
  PhoneAuthCubit() : super(PhoneAuthInitial());

  Future<void> submitPhoneNumber(String phoneNumber) async {
    emit(PhoneAuthLoading());

    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+20$phoneNumber',
      timeout: const Duration(seconds: 14),
      verificationCompleted: verificationCompleted,
      verificationFailed: verificationFailed,
      codeSent: codeSent,
      codeAutoRetrievalTimeout: codeAutoRetrievalTimeout,
    );
  }

  void verificationCompleted(PhoneAuthCredential credential) async {

    await signIn(credential);
  }

  void verificationFailed(FirebaseAuthException error) {
  
    emit(PhoneAuthFailed(error: error.toString()));
  }

  void codeSent(String verificationId, int? resendToken) {
   
    this.verificationId = verificationId;
 
    emit(submitphonenumber());
  }

  void codeAutoRetrievalTimeout(String verificationId) {

  }

  Future<void> submitOTP(String otpCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: otpCode);

    await signIn(credential);
  }

  Future<void> signIn(PhoneAuthCredential credential) async {
    try {
      await FirebaseAuth.instance.signInWithCredential(credential);
      emit(submitphonenumber());
    } catch (error) {
      emit(PhoneAuthFailed(error: error.toString()));
    }
  }

  // Future<void> logOut() async {
  //   await FirebaseAuth.instance.signOut();
  // }

  // User getLoggedInUser() {
  //   User firebaseUser = FirebaseAuth.instance.currentUser!;
  //   return firebaseUser;
  // }
}
