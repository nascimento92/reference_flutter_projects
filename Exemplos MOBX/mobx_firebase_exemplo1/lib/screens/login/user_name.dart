import 'package:flutter/cupertino.dart';
import 'package:mobx_firebase_exemplo1/screens/home.dart';

class UserName extends StatelessWidget {
  UserName({super.key});

  TextEditingController _text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Enter your name"),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 55),
            child: CupertinoTextField(
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 25),
              maxLength: 15,
              controller: _text,
              keyboardType: TextInputType.name,
              autofillHints: const <String>[AutofillHints.name],
            ),
          ),
          CupertinoButton.filled(
              child: Text("Continue"),
              onPressed: () {
                Navigator.push(
                    context, CupertinoPageRoute(builder: (context) => Home()));
              })
        ],
      ),
    );
  }
}
