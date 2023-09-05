import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_project/core/utils/horizital_shimmer.dart';
import 'package:test_project/provider/same_characters_cubit/same_characters_cubit.dart';
import 'package:test_project/views/widget/character_page/similar_charater_list.dart';
import 'package:test_project/views/widget/home/failure_message.dart';

class SameCharacterList extends StatelessWidget {
  const SameCharacterList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SameCharactersCubit, SameCharactersState>(
      builder: (context, state) {
        if (state is SameCharactersSuccess) {
          return SimilarCharacterList(
            similarCharacter: state.sameCharacters,
          );
        }
        if (state is SameCharactersFailure) {
          return FailureMessage(errMessage: state.errMessage);
        }

        return const Center(child: ShimmerLoadingHorizontal());
      },
    );
  }
}
