import 'package:flutter/material.dart';
import 'package:web_course/constants/style.dart';
import 'package:web_course/helpers/responsive.dart';
import '../custom/custom_text.dart';

AppBar topNavigationBar(BuildContext context, GlobalKey<ScaffoldState> key) {
  return AppBar(
    leading: !ResponsiveWidget.isSmallScreen(context)
        ? Row(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 14),
                child: Image.asset(
                  "assets/images/logo-web-course.png",
                  width: 28,
                ),
              )
            ],
          )
        : IconButton(
            onPressed: () {
              key.currentState!.openDrawer();
            },
            icon: const Icon(Icons.menu)),
    elevation: 0,
    title: Row(
      children: [
        //Menu selected name
        Visibility(
          child: CustomText(
            text: "Dash",
            color: ligthGreyColor,
            size: 20,
            weight: FontWeight.bold,
          ),
        ),
        Expanded(child: Container()),

        //settings Icon
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.settings,
            color: darkColor.withOpacity(.7),
          ),
        ),

        //notification Icon
        Stack(
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: darkColor.withOpacity(.7),
              ),
            ),
            Positioned(
              top: 7,
              right: 7,
              child: Container(
                width: 12,
                height: 12,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: activeColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: ligthColor, width: 2),
                ),
              ),
            ),
          ],
        ),

        //Divider
        Container(
          width: 1,
          height: 22,
          color: ligthGreyColor,
        ),

        //Space
        const SizedBox(
          width: 24,
        ),

        //User name
        CustomText(
          text: "Gabriel Nascimento",
          color: darkColor,
        ),

        //Space
        const SizedBox(
          width: 16,
        ),

        //user picture
        Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(30)),
          child: Container(
            padding: const EdgeInsets.all(2),
            margin: const EdgeInsets.all(2),
            child: CircleAvatar(
              backgroundColor: ligthColor,
              child: Icon(
                Icons.person_outline,
                color: darkColor,
              ),
            ),
          ),
        )
      ],
    ),
    iconTheme: IconThemeData(color: darkColor),
    backgroundColor: Colors.transparent,
  );
}
