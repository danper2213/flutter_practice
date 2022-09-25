import 'package:flutter/material.dart';
import 'package:flutter_practice/home_controller.dart';
import 'package:flutter_practice/shimmer_custom.dart';
import 'package:flutter_practice/theme_custom.dart';
import 'package:flutter_practice/views/text_validation.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  final bool enableShimmer = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Practice'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.local_activity_sharp),
        onPressed: () {
          //enableShimmer = !enableShimmer;
          Get.to(() => const TextFieldValidation());
        },
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
                child: controller.obx(
              (state) => ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      'Title $index',
                      style: TextStyleCustom.regular18(),
                    ),
                    subtitle: Text(
                      'Subtitle $index',
                      style: TextStyleCustom.regular16(),
                    ),
                    leading: CircleAvatar(child: Text('$index')),
                  );
                },
              ),
              onLoading: const ShimmerCustom(),
            )),
          ],
        ),
      ),
    );
  }
}
