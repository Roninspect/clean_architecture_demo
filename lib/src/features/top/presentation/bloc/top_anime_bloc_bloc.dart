// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:clean_architecture_demo/src/core/resources/failure.dart';
import 'package:clean_architecture_demo/src/features/top/data/models/animeModel.dart';
import 'package:clean_architecture_demo/src/features/top/domain/entities/anime.dart';
import 'package:clean_architecture_demo/src/features/top/domain/usecases/get_top_anime.dart';

part 'top_anime_bloc_event.dart';
part 'top_anime_bloc_state.dart';

class TopAnimeBlocBloc extends Bloc<TopAnimeBlocEvent, TopAnimeBlocState> {
  final GetTopAnimeUseCase _getTopAnimeUseCase;
  TopAnimeBlocBloc(
    this._getTopAnimeUseCase,
  ) : super(const TopAnimeLoading()) {
    on<GetTopAnime>((event, emit) async {
      final dataState = await _getTopAnimeUseCase();

      dataState.fold(
          (l) => emit(TopAnimeError(l.message)), (r) => emit(TopAnimeDone(r)));
    });
  }
}
