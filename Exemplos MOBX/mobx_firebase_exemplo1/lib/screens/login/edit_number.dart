import 'package:flutter/cupertino.dart';
import 'package:mobx_firebase_exemplo1/components/logo.dart';

class EditNumber extends StatelessWidget {
  const EditNumber({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Edit Number'),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(
                heigth: 50,
                width: 50,
                radius: Radius.circular(30),
              ),
              Text(
                "Verification • one step",
                style: TextStyle(
                    color: Color(0xFF08C187).withOpacity(0.7), fontSize: 28),
              )
            ],
          ),
          Text(
            "Enter your phone number",
            style: TextStyle(
                color: CupertinoColors.systemGrey.withOpacity(0.7),
                fontSize: 22),
          ),
          CupertinoListTile(onTap: () {}, title: const Text('Portugal'))
        ],
      ),
    );
  }
}
