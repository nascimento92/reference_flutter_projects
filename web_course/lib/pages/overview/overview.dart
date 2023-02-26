import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_course/constants/controllers.dart';
import 'package:web_course/helpers/responsive.dart';
import 'package:web_course/pages/overview/widgets/available_drivers_table.dart';
import 'package:web_course/pages/overview/widgets/overview_cards_large.dart';
import 'package:web_course/pages/overview/widgets/overview_cards_medium.dart';
import 'package:web_course/pages/overview/widgets/overview_cards_small.dart';
import 'package:web_course/widgets/charts/revenue_section_large.dart';
import 'package:web_course/widgets/charts/revenue_section_small.dart';
import 'package:web_course/widgets/custom/custom_text.dart';

class OverViewPage extends StatelessWidget {
  const OverViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => Row(
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: ResponsiveWidget.isSmallScreen(context) ? 56 : 6),
                child: CustomText(
                  text: menuController.activeItem.value,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              if (ResponsiveWidget.isLargeScreen(context))
                const OverviewCardsLargeScreen()
              else if (ResponsiveWidget.isMediumScreen(context))
                const OverviewCardsMediumScreen()
              else
                const OverviewCardsSmallScreen(),
              if (!ResponsiveWidget.isSmallScreen(context))
                const RevenueSectionLarge()
              else
                const RevenueSectionSmall(),
              const AvailableDriversTable()
            ],
          ),
        ),
      ],
    );
  }
}
