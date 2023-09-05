import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  final String firstText;
  final String secondText;
  const RichTextWidget(
      {super.key, required this.firstText, required this.secondText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(
            fontSize: 18,
          ),
          children: [
            TextSpan(
              text: "$firstText  /  ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(
              text: secondText,
              style: const TextStyle(
                  color: Color(0xffFFD700), overflow: TextOverflow.ellipsis),
            ),
          ],
        ),
      ),
    );
  }
}
