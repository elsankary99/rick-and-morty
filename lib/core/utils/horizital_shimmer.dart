import 'package:flutter/material.dart';
import 'package:test_project/core/extension/media_query.dart';
import 'package:test_project/core/utils/shimmer_widget.dart';

class ShimmerLoadingHorizontal extends StatelessWidget {
  const ShimmerLoadingHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      width: double.infinity,
      child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  padding: const EdgeInsets.all(8),
                  width: context.width * 0.27,
                  child: const ShimmerWidget());
            },
          )),
    );
  }
}
