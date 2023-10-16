import 'package:flutter/cupertino.dart';
import 'package:mobx_firebase_exemplo1/components/logo.dart';
import 'package:mobx_firebase_exemplo1/screens/login/select_country.dart';

class EditNumber extends StatefulWidget {
  const EditNumber({super.key});

  @override
  State<EditNumber> createState() => _EditNumberState();
}

class _EditNumberState extends State<EditNumber> {
  var _enterPhoneNumber = TextEditingController();
  Map<String, dynamic> data = {"name": "Portugal", "code": "+351"};
  Map<String, dynamic>? dataResult;

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
                    color: const Color(0xFF08C187).withOpacity(0.7),
                    fontSize: 28),
              )
            ],
          ),
          Text(
            "Enter your phone number",
            style: TextStyle(
                color: CupertinoColors.systemGrey.withOpacity(0.7),
                fontSize: 22),
          ),
          CupertinoListTile(
            onTap: () async {
              dataResult = await Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => const SelectCountry(),
                ),
              );

              if (dataResult != null) {
                setState(() {
                  data = dataResult!;
                });
              }
            },
            title: Text(
              data['name'],
              style: TextStyle(color: const Color(0xFF08C187).withOpacity(0.7)),
            ),
            additionalInfo: const Icon(
              CupertinoIcons.right_chevron,
              color: CupertinoColors.systemGrey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  data['code'],
                  style: const TextStyle(
                      fontSize: 20, color: CupertinoColors.secondaryLabel),
                ),
                Expanded(
                  child: CupertinoTextField(
                    controller: _enterPhoneNumber,
                    placeholder: "Enter your phone number",
                    keyboardType: TextInputType.number,
                    style: const TextStyle(
                        fontSize: 20, color: CupertinoColors.secondaryLabel),
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'You will recive an activation code in short time',
            style:
                TextStyle(fontSize: 12, color: CupertinoColors.secondaryLabel),
          ),
          const SizedBox(height: 40),
          CupertinoButton.filled(
              child: const Text('Request code'), onPressed: () {})
        ],
      ),
    );
  }
}
