import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key, required this.onpressed});
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onpressed,
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Text(
            'Terms and conditions',
            style: TextStyle(color: Colors.white.withOpacity(0.7)),
          ),
        ),
      ),
    );
  }
}
