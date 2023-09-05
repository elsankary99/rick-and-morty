part of 'all_characters_cubit.dart';

@immutable
sealed class AllCharactersState {}

final class AllCharactersInitial extends AllCharactersState {}

final class AllCharactersLoading extends AllCharactersState {}

final class AllCharactersPaginationLoading extends AllCharactersState {}

final class AllCharactersSuccess extends AllCharactersState {
  final List<CharactersModel> charactersList;

  AllCharactersSuccess({required this.charactersList});
}

final class AllCharactersFailure extends AllCharactersState {
  final String errMessage;

  AllCharactersFailure({required this.errMessage});
}
