import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerCustom extends StatelessWidget {
  const ShimmerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      //padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
              child: Shimmer.fromColors(
            baseColor: Colors.grey[500]!,
            highlightColor: Colors.grey[100]!,
            child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Title $index'),
                  subtitle: Text('Subtitle $index'),
                  leading: CircleAvatar(child: Text('$index')),
                );
              },
            ),
          )),
        ],
      ),
    );
  }
}
