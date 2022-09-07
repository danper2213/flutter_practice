import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          setState(() {
            enableShimmer = !enableShimmer;
          });
        },
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Expanded(
              child: enableShimmer
                  ? Shimmer.fromColors(
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
                    )
                  : ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text('Title $index'),
                          subtitle: Text('Subtitle $index'),
                          leading: CircleAvatar(child: Text('$index')),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
