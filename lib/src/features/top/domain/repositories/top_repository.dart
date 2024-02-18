import 'package:clean_architecture_demo/src/core/resources/datastate.dart';
import 'package:clean_architecture_demo/src/features/top/domain/entities/anime.dart';

abstract class TopRepository {
  Future<FutureEither<List<AnimeEntity>>> getTopAnime();
}
