import 'package:flutter/material.dart';
import 'package:test_project/core/extension/media_query.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/views/widget/character_page/rich_text_widget.dart';
import 'package:test_project/views/widget/character_page/bloc_builder_character_list.dart';

class CharacterInformation extends StatelessWidget {
  const CharacterInformation({
    super.key,
    required this.character,
  });

  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: context.height * 0.20,
            width: context.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichTextWidget(
                    firstText: "Location",
                    secondText: character.location!.name!),
                RichTextWidget(
                    firstText: "Species", secondText: character.species!),
                RichTextWidget(
                    firstText: "Gender", secondText: character.gender!),
                RichTextWidget(
                    firstText: "Origin", secondText: character.origin!.name!),
                RichTextWidget(
                    firstText: "Alive Or Dead", secondText: character.status!),
              ],
            ),
          ),
          SizedBox(height: context.height * .09),
          const Text(
            "Similar Characters :-",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: context.height * .02),
          const SameCharacterList(),
        ],
      ),
    ));
  }
}
