import 'package:clean_architecture_demo/src/core/resources/datastate.dart';
import 'package:clean_architecture_demo/src/features/top/domain/entities/anime.dart';
import 'package:clean_architecture_demo/src/features/top/domain/repositories/top_repository.dart';

class GetTopAnimeUseCase {
  final TopRepository _topRepository;

  GetTopAnimeUseCase({required TopRepository topRepository})
      : _topRepository = topRepository;
  Future<FutureEither<List<AnimeEntity>>> call() {
    return _topRepository.getTopAnime();
  }
}
