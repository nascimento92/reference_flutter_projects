import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx_firebase_exemplo1/screens/login/user_name.dart';

// ignore: constant_identifier_names
enum Status { Waiting, Error }

class VerifyNumber extends StatefulWidget {
  const VerifyNumber({super.key, required this.number});

  final number;

  @override
  State<VerifyNumber> createState() => _VerifyNumberState(number);
}

class _VerifyNumberState extends State<VerifyNumber> {
  late final int? phoneNumber;
  var _status = Status.Waiting;
  var _verificationId;
  var _textEditingController = TextEditingController();
  FirebaseAuth _auth = FirebaseAuth.instance;
  _VerifyNumberState(this.phoneNumber);

  @override
  void initState() {
    super.initState();
    _verifiPhoneNumber();
  }

  Future _verifiPhoneNumber() async{
    _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber.toString(),
      verificationCompleted: (phoneCuthCredentials) async{}, 
      verificationFailed: (verificationFailed) async{}, 
      codeSent: (verificationId, resendingToken) async{
        setState(() {
          _verificationId = verificationId;
        });
      }, 
      codeAutoRetrievalTimeout: (verificationId) async{},);
  }

  
  Future _sendCodeToFirebase({String? code}) async{
    if(_verificationId!=null){
      var credential = PhoneAuthProvider.credential(verificationId: _verificationId, smsCode: code!);
      
      await _auth.signInWithCredential(credential)
      .then((value){
        Navigator.push(context, CupertinoPageRoute(builder: (context) => UserName()));
      })
      .whenComplete((){})
      .onError((error, stackTrace){
        setState(() {
          _textEditingController.text='';
          _status = Status.Error;
          
        });
      });
    }
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
                    print(value);
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
                        child: const Text("RESEND OTP"), onPressed: () async => _sendCodeToFirebase())
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
                  onPressed: () async => _sendCodeToFirebase(),
                ),
              ],
            ),
    );
  }
}
