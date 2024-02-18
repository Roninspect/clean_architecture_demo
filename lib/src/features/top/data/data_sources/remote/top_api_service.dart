import 'package:clean_architecture_demo/src/core/constants/constants.dart';
import 'package:clean_architecture_demo/src/features/top/data/models/animeModel.dart';
import 'package:dio/dio.dart';

class TopApiService {
  final Dio _client;

  TopApiService({required Dio client}) : _client = client;

  Future<List<AnimeModel>> getTopAnime() async {
    try {
      final res = await _client.get('$baseURL/top/anime?limit=25');

      if (res.statusCode != 200) {
        throw DioException(
          requestOptions: RequestOptions(),
          message: "SomeError Occured",
        );
      }

      final data = res.data['data'] as List<dynamic>;

      final List<AnimeModel> topAnimes =
          data.map((e) => AnimeModel.fromMap(e)).toList();

      return topAnimes;
    } catch (e, stk) {
      print(stk);
      throw DioException(
        requestOptions: RequestOptions(),
        message: e.toString(),
      );
    }
  }
}
