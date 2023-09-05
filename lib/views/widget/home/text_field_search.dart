import 'package:flutter/material.dart';

class TextFieldSearch extends StatelessWidget {
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  const TextFieldSearch({super.key, this.onChanged, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      color: Colors.transparent,
      child: TextField(
        autofocus: true,
        controller: controller,
        onChanged: onChanged,
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Search',
            helperStyle: TextStyle(color: Colors.white)),
      ),
    );
  }
}
