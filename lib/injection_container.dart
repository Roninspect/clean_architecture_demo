import 'package:clean_architecture_demo/src/features/top/data/data_sources/remote/top_api_service.dart';
import 'package:clean_architecture_demo/src/features/top/data/repository/top_repository_impl.dart';
import 'package:clean_architecture_demo/src/features/top/domain/repositories/top_repository.dart';
import 'package:clean_architecture_demo/src/features/top/domain/usecases/get_top_anime.dart';
import 'package:clean_architecture_demo/src/features/top/presentation/bloc/top_anime_bloc_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  //external Dependencies
  sl.registerSingleton<Dio>(Dio());

  // services
  sl.registerSingleton<TopApiService>(TopApiService(client: sl()));

  // abstract classes
  sl.registerSingleton<TopRepository>(TopRepositoryImpl(sl()));

  // usecases
  sl.registerSingleton<GetTopAnimeUseCase>(
      GetTopAnimeUseCase(topRepository: sl()));

// blocs
  sl.registerFactory<TopAnimeBlocBloc>(() => TopAnimeBlocBloc(sl()));
}
