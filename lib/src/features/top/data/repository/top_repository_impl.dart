import 'package:clean_architecture_demo/src/core/resources/datastate.dart';
import 'package:clean_architecture_demo/src/core/resources/failure.dart';
import 'package:clean_architecture_demo/src/features/top/data/data_sources/remote/top_api_service.dart';
import 'package:clean_architecture_demo/src/features/top/data/models/animeModel.dart';
import 'package:clean_architecture_demo/src/features/top/domain/entities/anime.dart';
import 'package:clean_architecture_demo/src/features/top/domain/repositories/top_repository.dart';

import 'package:fpdart/fpdart.dart';

class TopRepositoryImpl implements TopRepository {
  final TopApiService _topApiService;

  TopRepositoryImpl(this._topApiService);

  @override
  Future<FutureEither<List<AnimeModel>>> getTopAnime() async {
    try {
      final result = await _topApiService.getTopAnime();

      return right(result);
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
