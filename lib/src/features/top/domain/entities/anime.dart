import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final int id;
  final String images;
  final String? trailer;
  final String title;
  final String titleEnglish;
  final String titleJapanese;
  final String type;
  final String status;
  final String airedFrom;
  final String? airedTo;
  final String duration;
  final String rating;
  final String synopsis;
  final double score;
  final int rank;
  final int scoredBy;
  final int episodes;

  const AnimeEntity(
      {required this.id,
      required this.images,
      required this.trailer,
      required this.title,
      required this.titleEnglish,
      required this.titleJapanese,
      required this.type,
      required this.status,
      required this.airedFrom,
      required this.airedTo,
      required this.duration,
      required this.rating,
      required this.synopsis,
      required this.score,
      required this.rank,
      required this.scoredBy,
      required this.episodes});

  @override
  List<Object?> get props => [
        id,
        images,
        trailer,
        title,
        titleEnglish,
        titleJapanese,
        type,
        status,
        airedFrom,
        airedTo,
        duration,
        rating,
        synopsis,
        score,
        rank,
        scoredBy,
        episodes,
      ];
}
