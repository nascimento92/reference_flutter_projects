import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:web_course/screens/other.dart';

import '../controllers/counterController.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final CounterController counterController = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Clicks: ${counterController.count.value}"),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Get.to(() => OtherScreen());
                  },
                  child: Text("Open Other Screen"))
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
