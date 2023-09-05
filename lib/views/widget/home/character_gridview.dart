import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/utils/shimmer_widget.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/provider/all_characters_cubit/all_characters_cubit.dart';
import 'package:test_project/views/widget/home/character_card.dart';

class CharacterGridView extends StatefulWidget {
  final List<CharactersModel> characters;
  const CharacterGridView({
    super.key,
    required this.characters,
  });

  @override
  State<CharacterGridView> createState() => _CharacterGridViewState();
}

class _CharacterGridViewState extends State<CharacterGridView> {
  late ScrollController controller;
  var nextPage = 2;
  var isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller.addListener(pagination);
  }

  void pagination() async {
    double currentPosition = controller.position.pixels;
    double maxPosition = controller.position.maxScrollExtent;
    if (currentPosition == maxPosition) {
      if (isLoading == true) {
        isLoading = false;
        log('=======Play========');

        await BlocProvider.of<AllCharactersCubit>(context)
            .getAllCharacters(pageNumber: nextPage++);
        log('=======Stop========');

        isLoading = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    log('=======SetState========');

    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: GridView.builder(
          controller: controller,
          itemCount: widget.characters.length + 2,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 2 / 3,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemBuilder: (context, index) {
            return widget.characters.isEmpty
                ? const Center(
                    child: Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                : index >= widget.characters.length
                    ? const ShimmerWidget()
                    : CharacterCard(character: widget.characters[index]);
          },
        ));
  }
}
