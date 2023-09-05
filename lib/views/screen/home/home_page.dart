import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/Dependency/dependency_injections.dart';
import 'package:test_project/data/repository/characters_repo.dart';
import 'package:test_project/provider/all_characters_cubit/all_characters_cubit.dart';
import 'package:test_project/views/screen/home/home_page_body.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AllCharactersCubit(getIt.get<CharactersRepository>())
        ..getAllCharacters(),
      child: const HomePageBody(),
    );
  }
}
