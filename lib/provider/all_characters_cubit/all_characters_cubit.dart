import 'dart:developer';

import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/data/repository/characters_repo.dart';

part 'all_characters_state.dart';

class AllCharactersCubit extends Cubit<AllCharactersState> {
  final CharactersRepository charactersRepository;

  AllCharactersCubit(this.charactersRepository) : super(AllCharactersInitial());
//!(1)
  Future<void> getAllCharacters({int pageNumber = 1}) async {
    if (pageNumber == 1) {
      log("============emit(AllCharactersLoading());============");
      emit(AllCharactersLoading());
    } else {
      emit(AllCharactersPaginationLoading());
      log("============emit(AllCharactersPaginationLoading());============");
    }
    var data =
        await charactersRepository.getAllCharacters(pageNumber: pageNumber);
    data.fold(
      (errors) => emit(AllCharactersFailure(errMessage: errors.errMessage)),
      (characters) => emit(AllCharactersSuccess(charactersList: characters)),
    );
  }
}
