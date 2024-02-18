import 'package:clean_architecture_demo/src/features/top/presentation/bloc/top_anime_bloc_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopAnimePage extends StatelessWidget {
  const TopAnimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Top Animes"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: BlocBuilder<TopAnimeBlocBloc, TopAnimeBlocState>(
            builder: (_, state) {
              if (state is TopAnimeLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is TopAnimeError) {
                return Center(
                  child: Text(state.failure!),
                );
              }
              if (state is TopAnimeDone) {
                return GridView.builder(
                  itemCount: state.topAnimes!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 10 / 14,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    final anime = state.topAnimes![index];

                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Image.network(
                          anime.images,
                          fit: BoxFit.cover,
                          height: 350,
                          width: 200,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Chip(
                              backgroundColor: const Color(0xff2E51A2),
                              label: Text(
                                anime.rank.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.only(left: 5, bottom: 3),
                              width: double.infinity,
                              color: const Color.fromARGB(190, 0, 0, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    anime.title,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color: Colors.white),
                                  ),
                                  Row(
                                    children: [
                                      anime.type == 'TV'
                                          ? Text(
                                              '${anime.type}(${anime.episodes})',
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            )
                                          : const Text(
                                              'Movie',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontSize: 12,
                                                  color: Colors.white),
                                            ),
                                      const SizedBox(width: 7),
                                      const Icon(Icons.star_border,
                                          color: Colors.white, size: 20),
                                      Text(
                                        anime.score.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.white),
                                      ),
                                      const SizedBox(width: 7),
                                      const Icon(
                                        Icons.person,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      Text(
                                        anime.scoredBy.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12,
                                            color: Colors.white),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    );
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
