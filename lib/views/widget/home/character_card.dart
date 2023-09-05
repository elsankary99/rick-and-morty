import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/router/app_router.dart';
import 'package:test_project/data/model/characters/characters.dart';

class CharacterCard extends StatelessWidget {
  final CharactersModel character;
  const CharacterCard({
    super.key,
    required this.character,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.id!,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GestureDetector(
          onTap: () {
            log("${character.id}");
            context.router.push(CharacterRoute(character: character));
          },
          child: Stack(
            children: [
              Positioned.fill(
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: character.image!,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              Positioned(
                top: 10,
                left: 10,
                child: CircleAvatar(
                    backgroundColor: Colors.black54,
                    child: Text(
                      "${character.id!}",
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          overflow: TextOverflow.ellipsis),
                    )),
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
                        fontSize: 18,
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
