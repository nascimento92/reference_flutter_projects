import 'package:flutter/material.dart';
import 'package:web_course/widgets/cards/info_card.dart';

class OverviewCardsMediumScreen extends StatelessWidget {
  const OverviewCardsMediumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            InfoCard(
              title: "Rides in progress",
              value: "7",
              onTap: () {},
              topColor: Colors.orange,
              isActive: false,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Packages delivered",
              value: "17",
              topColor: Colors.lightGreen,
              onTap: () {},
              isActive: false,
            ),
          ],
        ),
        SizedBox(
          height: _width / 64,
        ),
        Row(
          children: [
            InfoCard(
              title: "Cancelled delivery",
              value: "3",
              topColor: Colors.redAccent,
              onTap: () {},
              isActive: false,
            ),
            SizedBox(
              width: _width / 64,
            ),
            InfoCard(
              title: "Scheduled deliveries",
              value: "32",
              onTap: () {},
              isActive: false,
            ),
          ],
        ),
      ],
    );
  }
}
