import 'dart:ui';
import 'package:flutter/material.dart';

class BlueImagePageScaffold extends StatelessWidget {
  const BlueImagePageScaffold(
      {super.key, required this.body, required this.imagePath});
  final List<Widget> body;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.fill),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          color: Colors.black.withOpacity(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: body,
          ),
        ),
      ),
    );
  }
}
