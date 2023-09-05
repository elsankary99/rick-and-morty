import 'package:flutter/material.dart';
import 'package:test_project/core/utils/shimmer_widget.dart';

class ShimmerLoading extends StatelessWidget {
  final Axis scrollDirection;
  const ShimmerLoading({super.key, this.scrollDirection = Axis.vertical});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: GridView.builder(
          scrollDirection: scrollDirection,
          itemCount: 20,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return const ShimmerWidget();
          },
        ));
  }
}
