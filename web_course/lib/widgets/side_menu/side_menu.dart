import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_course/constants/controllers.dart';
import 'package:web_course/constants/style.dart';
import 'package:web_course/helpers/responsive.dart';
import 'package:web_course/widgets/side_menu/menu_item_list.dart';
import 'package:web_course/widgets/custom/custom_text.dart';
import 'package:web_course/widgets/side_menu/side_menu_item.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Container(
      color: ligthColor,
      child: ListView(
        children: [
          if (ResponsiveWidget.isSmallScreen(context))
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Row(
                  children: [
                    SizedBox(width: _width / 48),
                    Padding(
                      padding: const EdgeInsets.only(right: 12),
                      child: Image.asset("assets/images/logo-web-course.png"),
                    ),
                    Flexible(
                      child: CustomText(
                        text: "Dash",
                        size: 20,
                        weight: FontWeight.bold,
                        color: activeColor,
                      ),
                    ),
                    SizedBox(width: _width / 48),
                  ],
                ),
                SizedBox(width: _width / 48),
              ],
            ),
          Divider(
            color: ligthGreyColor.withOpacity(.1),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: sideMenuItems
                .map(
                  (itemName) => SideMenuItem(
                    itemName: itemName == AuthenticationPageRoute
                        ? "Log Out"
                        : itemName,
                    onTap: () {
                      if (itemName == AuthenticationPageRoute) {
                        //TODO:: go to authentication page
                      }

                      if (!menuController.isActive(itemName)) {
                        menuController.changeActiveitemTo(itemName);
                        if (ResponsiveWidget.isSmallScreen(context)) {
                          Get.back();
                        }
                        navigationController.navigateTo(itemName);
                      }
                    },
                  ),
                )
                .toList(),
          )
        ],
      ),
    );
  }
}
