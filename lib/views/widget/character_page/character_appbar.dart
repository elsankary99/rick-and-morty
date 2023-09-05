import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/extension/media_query.dart';
import 'package:test_project/data/model/characters/characters.dart';

class CharacterAppBar extends StatelessWidget {
  const CharacterAppBar({
    super.key,
    required this.character,
  });

  final CharactersModel character;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: context.height * .375,
      flexibleSpace: FlexibleSpaceBar(
        background: Hero(
          tag: character.id!,
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: character.image!,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  height: 40,
                  width: double.infinity,
                  color: Colors.black38,
                  child: Center(
                      child: Text(
                    character.name!,
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        overflow: TextOverflow.ellipsis),
                  )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
