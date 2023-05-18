import 'package:flutter/material.dart';

class Star extends StatelessWidget {
  final double? tamanho;
  final Color? cor;

  const Star({super.key, this.tamanho, this.cor});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star,
      size: tamanho ?? 15,
      color: cor ?? Colors.blue,
    );
  }
}
