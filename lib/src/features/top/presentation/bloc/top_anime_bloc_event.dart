part of 'top_anime_bloc_bloc.dart';

sealed class TopAnimeBlocEvent extends Equatable {
  const TopAnimeBlocEvent();

  @override
  List<Object> get props => [];
}

class GetTopAnime extends TopAnimeBlocEvent {
  const GetTopAnime();
}
