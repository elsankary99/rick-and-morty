import 'package:get_it/get_it.dart';
import 'package:test_project/data/repository/characters_repo.dart';
import 'package:test_project/data/repository/same_character_repo.dart';
import 'package:test_project/data/service/character_service.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<CharactersService>(CharactersService());

  getIt.registerSingleton<CharactersRepository>(
      CharactersRepository(charactersService: getIt.get<CharactersService>()));

  getIt.registerSingleton<SameCharactersRepository>(SameCharactersRepository(
      charactersService: getIt.get<CharactersService>()));
}
