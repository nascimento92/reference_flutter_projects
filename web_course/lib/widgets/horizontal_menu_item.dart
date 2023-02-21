import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_course/constants/controllers.dart';
import 'package:web_course/constants/style.dart';
import 'package:web_course/widgets/custom_text.dart';

class HorizontalMenuItem extends StatelessWidget {
  final String itemName;
  final Function() onTap;
  const HorizontalMenuItem(
      {super.key, required this.itemName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return InkWell(
      onTap: onTap,
      onHover: (value) {
        value
            ? menuController.onHover(itemName)
            : menuController.onHover("not hovering");
      },
      child: Obx(
        () => Container(
          //barra embaixo do menu selecionado
          color: menuController.isHovering(itemName)
              ? ligthGreyColor.withOpacity(.1)
              : Colors.transparent,

          child: Row(
            children: [
              //menu selecionado ou com o mouse em cima
              //barrinha do lado do menu
              Visibility(
                visible: menuController.isHovering(itemName) ||
                    menuController.isActive(itemName),
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: Container(
                  width: 6,
                  height: 40,
                  color: darkColor,
                ),
              ),

              //espaço
              SizedBox(width: _width / 88),

              //Icone
              Padding(
                padding: const EdgeInsets.all(16),
                child: menuController.returnIconFor(itemName),
              ),

              //item do menu ativo
              if (!menuController.isActive(itemName))
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: menuController.isHovering(itemName)
                      ? darkColor
                      : ligthGreyColor,
                ))
              else
                Flexible(
                    child: CustomText(
                  text: itemName,
                  color: darkColor,
                  size: 18,
                  weight: FontWeight.bold,
                ))
            ],
          ),
        ),
      ),
    );
  }
}
