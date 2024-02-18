part of 'top_anime_bloc_bloc.dart';

sealed class TopAnimeBlocState extends Equatable {
  final List<AnimeEntity>? topAnimes;
  final String? failure;
  const TopAnimeBlocState({this.topAnimes, this.failure});

  @override
  List<Object> get props => [topAnimes!, failure!];
}

class TopAnimeBlocInitial extends TopAnimeBlocState {}

class TopAnimeLoading extends TopAnimeBlocState {
  const TopAnimeLoading();
}

class TopAnimeError extends TopAnimeBlocState {
  const TopAnimeError(String failure) : super(failure: failure);
}

class TopAnimeDone extends TopAnimeBlocState {
  const TopAnimeDone(List<AnimeEntity> topAnime) : super(topAnimes: topAnime);
}
