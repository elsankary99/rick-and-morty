import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/Dependency/dependency_injections.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/data/repository/same_character_repo.dart';
import 'package:test_project/provider/same_characters_cubit/same_characters_cubit.dart';
import 'package:test_project/views/screen/character_page/character_page_body.dart';

@RoutePage()
class CharacterPage extends StatelessWidget {
  final CharactersModel character;

  const CharacterPage({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SameCharactersCubit(
          sameCharactersRepository: getIt.get<SameCharactersRepository>())
        ..getSameCharacters(similar: character.species!),
      child: Scaffold(body: CharacterPageBody(character: character)),
    );
  }
}
