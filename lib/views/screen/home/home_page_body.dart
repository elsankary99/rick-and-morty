import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/utils/shimmer_loading.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/provider/all_characters_cubit/all_characters_cubit.dart';
import 'package:test_project/views/widget/home/character_gridview.dart';
import 'package:test_project/views/widget/home/failure_message.dart';
import 'package:test_project/views/widget/home/text_field_search.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody> {
  bool isSearch = false;
  TextEditingController controller = TextEditingController();
  List<CharactersModel> allCharactersList = [];
  List<CharactersModel> searchCharacter = [];
  @override
  void initState() {
    super.initState();

    searchCharacter = allCharactersList;
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onSearch(String input) {
    List<CharactersModel> result = [];
    if (input.trim().isEmpty) {
      result = allCharactersList;
    } else {
      result = allCharactersList
          .where((character) =>
              character.name!.toLowerCase().startsWith(input.toLowerCase()))
          .toList();
    }

    setState(() {
      searchCharacter = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: isSearch
            ? TextFieldSearch(
                onChanged: (input) => onSearch(input),
              )
            : const Text("Characters"),
        leading: isSearch
            ? IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    if (searchCharacter != allCharactersList) {
                      searchCharacter = allCharactersList;
                    }

                    isSearch = !isSearch;
                  });
                },
              )
            : IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    isSearch = !isSearch;
                  });
                },
              ),
      ),
      body: BlocConsumer<AllCharactersCubit, AllCharactersState>(
        listener: (BuildContext context, AllCharactersState state) {
          if (state is AllCharactersSuccess) {
            allCharactersList.addAll(state.charactersList);
          }
        },
        builder: (context, state) {
          if (state is AllCharactersSuccess ||
              state is AllCharactersPaginationLoading) {
            return CharacterGridView(
              characters: searchCharacter,
            );
          }
          if (state is AllCharactersFailure) {
            return FailureMessage(errMessage: state.errMessage);
          }
          return const Center(child: ShimmerLoading());
        },
      ),
    );
  }
}
