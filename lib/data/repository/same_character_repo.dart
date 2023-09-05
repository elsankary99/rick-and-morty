import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_project/core/constant/app_url.dart';
import 'package:test_project/core/error/error.dart';
import 'package:test_project/data/model/characters/characters.dart';
import 'package:test_project/data/service/character_service.dart';

class SameCharactersRepository {
  final CharactersService charactersService;

  SameCharactersRepository({required this.charactersService});
  Future<Either<Failure, List<CharactersModel>>> getSameCharacters(
      {String similar = ""}) async {
    try {
      final data = await charactersService
          .getCharacters("${AppUrl.characterEndPoint}/?species=$similar");
      List<CharactersModel> characterList = [];

      for (var oneCharacter in data["results"]) {
        characterList.add(CharactersModel.fromJson(oneCharacter));
      }
      log("+++++31++++$characterList++++++++");

      return right(characterList);
    } catch (e) {
      if (e is DioException) {
        return left(Error.fromDioError(e));
      }
      log("+++++++++${e.toString()}++++++++");

      return left(Error(errMessage: e.toString()));
    }

    // return data
    //     .map((characters) => CharactersModel.fromJson(characters))
    //     .toList();
  }
}
