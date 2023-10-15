import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo(
      {super.key,
      required this.width,
      required this.heigth,
      required this.radius});
  final double width;
  final double heigth;
  final Radius radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: heigth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(radius),
        shape: BoxShape.rectangle,
        color: Colors.white.withOpacity(0.8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Image.asset(
          'images/whatsapp.png',
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
