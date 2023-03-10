import 'package:flutter/material.dart';
import 'package:web_course/constants/style.dart';

class InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final Color? topColor;
  final bool isActive;
  final Function() onTap;

  const InfoCard(
      {super.key,
      required this.title,
      required this.value,
      this.topColor,
      required this.isActive,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 136,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 6),
                    color: ligthGreyColor.withOpacity(.1),
                    blurRadius: 12)
              ],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: ligthGreyColor, width: .5)),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      color: topColor ?? activeColor,
                      height: 5,
                    ),
                  ),
                ],
              ),
              Expanded(child: Container()),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "$title\n",
                    style: TextStyle(
                        fontSize: 16,
                        color: isActive ? activeColor : ligthGreyColor),
                  ),
                  TextSpan(
                    text: "$value",
                    style: TextStyle(
                        fontSize: 40,
                        color: isActive ? activeColor : darkColor),
                  ),
                ]),
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
