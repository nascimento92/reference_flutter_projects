import 'package:flutter/material.dart';
import 'package:web_course/widgets/custom_text.dart';

class ClientsPage extends StatelessWidget {
  const ClientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CustomText(text: "Clients"),
    );
  }
}
