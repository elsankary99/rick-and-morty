import 'package:flutter/material.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/views/widget/character_page/character_information.dart';
import 'package:test_project/views/widget/character_page/character_appbar.dart';

class CharacterPageBody extends StatelessWidget {
  const CharacterPageBody({super.key, required this.character});

  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
        physics: const NeverScrollableScrollPhysics(),
        slivers: [
          CharacterAppBar(character: character),
          CharacterInformation(character: character),
        ]);
  }
}
