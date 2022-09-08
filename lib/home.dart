import 'package:flutter/material.dart';
import 'package:flutter_practice/home_controller.dart';
import 'package:flutter_practice/shimmer_custom.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class Home extends GetView<HomeController> {
  Home({Key? key}) : super(key: key);

  bool enableShimmer = true;
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
                    title: Text('Title $index'),
                    subtitle: Text('Subtitle $index'),
                    leading: CircleAvatar(child: Text('$index')),
                  );
                },
              ),
              onLoading: ShimmerCustom(),
            )),
          ],
        ),
      ),
    );
  }
}
