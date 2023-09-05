part of 'same_characters_cubit.dart';

@immutable
sealed class SameCharactersState {}

final class SameCharactersInitial extends SameCharactersState {}

final class SameCharactersLoading extends SameCharactersState {}

final class SameCharactersFailure extends SameCharactersState {
  final String errMessage;

  SameCharactersFailure({required this.errMessage});
}

final class SameCharactersSuccess extends SameCharactersState {
  final List<CharactersModel> sameCharacters;

  SameCharactersSuccess({required this.sameCharacters});
}
