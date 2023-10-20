import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:mobx_firebase_exemplo1/screens/login/user_name.dart';

// ignore: constant_identifier_names
enum Status { Waiting, Error }

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key, required this.number});

  final String number;

  @override
  State<VerifyNumber> createState() => _VerifyNumberState(number);
}

class _VerifyNumberState extends State<VerifyNumber> {
  // ignore: prefer_typing_uninitialized_variables
  final phoneNumber;
  var _status = Status.Waiting;
  // ignore: prefer_typing_uninitialized_variables
  var _verificationId;
  final _textEditingController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  _VerifyNumberState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
    _verifyPhoneNumber();
  }

  Future _verifyPhoneNumber() async {
    setState(() {
      _verificationId = '871777';
    });
    // await _auth.verifyPhoneNumber(
    //     phoneNumber: phoneNumber,
    //     verificationCompleted: (PhoneAuthCredential credential) {},
    //     verificationFailed: (FirebaseAuthException e) {
    //       if (e.code == 'invalid-phone-number') {
    //         // ignore: avoid_print
    //         print('The provided phone number is not valid.');
    //       }
    //     },
    //     codeSent: (String verificationId, int? resendToken) {
    //       setState(() {
    //         _verificationId = verificationId;
    //       });
    //     },
    //     codeAutoRetrievalTimeout: (String verificationId) {});
  }

  Future _sendCodeToFirebase({String? code}) async {
    if (_verificationId != null) {
      if (_verificationId == code) {
        Navigator.push(
            context, CupertinoPageRoute(builder: (context) => UserName()));
      } else {
        setState(() {
          _textEditingController.text = '';
          _status = Status.Error;
        });
      }
    }

    // if (_verificationId != null) {
    //   var credential = PhoneAuthProvider.credential(
    //       verificationId: _verificationId, smsCode: code!);

    //   await _auth
    //       .signInWithCredential(credential)
    //       .then((value) {
    //         Navigator.push(
    //             context, CupertinoPageRoute(builder: (context) => UserName()));
    //       })
    //       .whenComplete(() {})
    //       .onError((error, stackTrace) {
    //         setState(() {
    //           _textEditingController.text = '';
    //           _status = Status.Error;
    //         });
    //       });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
          middle: Text("Verify Number"), previousPageTitle: "Edit Number"),
      child: _status != Status.Error
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                        color: const Color(0xFF08C187).withOpacity(0.7),
                        fontSize: 30),
                  ),
                ),
                const Text(
                  "Enter OTP sent to",
                  style: TextStyle(
                      color: CupertinoColors.secondaryLabel, fontSize: 20),
                ),
                Text(phoneNumber == null ? "" : phoneNumber.toString()),
                CupertinoTextField(
                  onChanged: (value) async {
                    if (value.length == 6) {
                      _sendCodeToFirebase(code: value);
                    }
                  },
                  textAlign: TextAlign.center,
                  style: const TextStyle(letterSpacing: 30, fontSize: 30),
                  maxLength: 6,
                  controller: _textEditingController,
                  keyboardType: TextInputType.number,
                  autofillHints: const <String>[AutofillHints.telephoneNumber],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Dint\'t receive the OTP?'),
                    CupertinoButton(
                        child: const Text("RESEND OTP"),
                        onPressed: () async => _verifyPhoneNumber())
                  ],
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'OTP Verification',
                    style: TextStyle(
                        color: const Color(0xFF08C187).withOpacity(0.7),
                        fontSize: 30),
                  ),
                ),
                const Text("The code used is invalid!"),
                CupertinoButton(
                  child: const Text("Edit Number"),
                  onPressed: () => Navigator.pop(context),
                ),
                CupertinoButton(
                  child: const Text("Resend Code"),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
    );
  }
}
