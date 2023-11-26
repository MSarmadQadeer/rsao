import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:rsao/utils/routes/routes_name.dart';
import 'package:rsao/views/user_details_screen.dart';
import 'package:rsao/widgets/enter_otp_modal.dart';
import 'package:rsao/widgets/progress_dialog.dart';

class LoginViewModel extends ChangeNotifier {
  User? firebaseUser;
  CountryCode countryCode =
      const CountryCode(name: 'Pakistan', code: "PK", dialCode: "+92");

  onCountryChange(BuildContext context) async {
    final code = await const FlCountryCodePicker().showPicker(context: context);
    if (code != null) countryCode = code;
    notifyListeners();
  }

  signInWithMobileNumber({
    required String phoneNumber,
    required BuildContext context,
  }) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return const ProgressDialog(
          message: "Please wait...",
        );
      },
    );

    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: countryCode.dialCode + phoneNumber,
          verificationCompleted: (PhoneAuthCredential authCredential) async {
            await firebaseAuth
                .signInWithCredential(authCredential)
                .then((value) {
              Navigator.pushNamed(context, RoutesName.main);
            });
          },
          verificationFailed: ((error) {}),
          codeSent: (String verificationId, [int? forceResendingToken]) {
            Navigator.pop(context);
            showDialog(
                context: context,
                barrierDismissible: false,
                builder: (context) => EnterOTPModal(
                      verificationId: verificationId,
                      onSubmitOTP: onSubmitOTP,
                    ));
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            verificationId = verificationId;
          },
          timeout: const Duration(seconds: 90));
      // ignore: empty_catches
    } catch (e) {}
  }

  onSubmitOTP({
    required String verificationId,
    required String smsCode,
    required BuildContext context,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext c) {
        return const ProgressDialog(
          message: "Please wait...",
        );
      },
    );
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    firebaseAuth.signInWithCredential(credential).then((response) async {
      firebaseUser = response.user;

      DatabaseReference userRef =
          FirebaseDatabase.instance.ref().child("users");
      userRef.child(firebaseUser!.uid).once().then((userKey) {
        final snap = userKey.snapshot;
        if (snap.value != null) {
          // currentFirebaseUser = firebaseUser;
          Fluttertoast.showToast(msg: "Login Successful.");
          Navigator.pop(context);
          Navigator.pushNamed(context, RoutesName.main);
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  UserDetailsScreen(saveUserInfo: saveUserInfo),
            ),
          );
        }
      });
    }).catchError((e) {});
  }

  saveUserInfo({required String name, required BuildContext context}) async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return const ProgressDialog(
            message: "Processing, Please wait...",
          );
        });

    Map userMap = {
      "id": firebaseUser!.uid,
      "name": name,
      "phone": firebaseUser!.phoneNumber
    };

    DatabaseReference userRef = FirebaseDatabase.instance.ref().child("users");
    userRef.child(firebaseUser!.uid).set(userMap);

    // currentFirebaseUser = firebaseUser;
    Navigator.pop(context);
    Navigator.pushNamed(context, RoutesName.main);
  }
}
