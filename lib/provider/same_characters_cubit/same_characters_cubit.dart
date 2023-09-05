import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/data/repository/same_character_repo.dart';

part 'same_characters_state.dart';

class SameCharactersCubit extends Cubit<SameCharactersState> {
  final SameCharactersRepository sameCharactersRepository;
  SameCharactersCubit({required this.sameCharactersRepository})
      : super(SameCharactersInitial());

  Future<void> getSameCharacters({String similar = ""}) async {
    emit(SameCharactersLoading());
    var data =
        await sameCharactersRepository.getSameCharacters(similar: similar);
    data.fold(
        (error) => emit(SameCharactersFailure(errMessage: error.errMessage)),
        (characters) =>
            emit(SameCharactersSuccess(sameCharacters: characters)));
  }
}
