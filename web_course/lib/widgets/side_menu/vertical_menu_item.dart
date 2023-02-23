import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_course/widgets/custom/custom_text.dart';
import '../../constants/controllers.dart';
import '../../constants/style.dart';

class VerticalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const VerticalMenuItem(
      {super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          color: menuController.isHovering(itemName)
              ? ligthGreyColor.withOpacity(.1)
              : Colors.transparent,
          child: Row(children: [
            Visibility(
              visible: menuController.isHovering(itemName) ||
                  menuController.isActive(itemName),
              maintainSize: true,
              maintainState: true,
              maintainAnimation: true,
              child: Container(
                width: 3,
                height: 72,
                color: darkColor,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: menuController.returnIconFor(itemName),
                  ),
                  if (!menuController.isActive(itemName))
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        color: menuController.isHovering(itemName)
                            ? darkColor
                            : ligthGreyColor,
                      ),
                    )
                  else
                    Flexible(
                      child: CustomText(
                        text: itemName,
                        color: darkColor,
                        size: 18,
                        weight: FontWeight.bold,
                      ),
                    ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
