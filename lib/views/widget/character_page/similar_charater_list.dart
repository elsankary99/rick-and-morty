import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_project/core/extension/media_query.dart';
import 'package:test_project/data/model/characters/characters.dart';

class SimilarCharacterList extends StatelessWidget {
  final List<CharactersModel> similarCharacter;
  const SimilarCharacterList({
    super.key,
    required this.similarCharacter,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.height * 0.2,
      width: double.infinity,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: similarCharacter.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                width: context.width * 0.27,
                child: Stack(children: [
                  Positioned.fill(
                    child: CachedNetworkImage(
                      fit: BoxFit.fill,
                      imageUrl: similarCharacter[index].image!,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 20,
                        width: double.infinity,
                        color: Colors.black54,
                        child: Center(
                            child: Text(
                          similarCharacter[index].name!,
                          style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white,
                              overflow: TextOverflow.ellipsis),
                        )),
                      ))
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
