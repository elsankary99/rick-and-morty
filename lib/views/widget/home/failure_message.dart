import 'package:flutter/material.dart';

class FailureMessage extends StatelessWidget {
  final String errMessage;
  const FailureMessage({super.key, required this.errMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.warning_amber_rounded,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              errMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}
