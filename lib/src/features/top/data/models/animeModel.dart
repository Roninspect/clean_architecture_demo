// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:clean_architecture_demo/src/features/top/domain/entities/anime.dart';

class AnimeModel extends AnimeEntity {
  AnimeModel(
      {required super.id,
      required super.images,
      required super.trailer,
      required super.title,
      required super.titleEnglish,
      required super.titleJapanese,
      required super.type,
      required super.status,
      required super.airedFrom,
      required super.airedTo,
      required super.duration,
      required super.rating,
      required super.synopsis,
      required super.score,
      required super.rank,
      required super.scoredBy,
      required super.episodes});

  AnimeModel copyWith({
    int? id,
    String? images,
    String? trailer,
    String? title,
    String? titleEnglish,
    String? titleJapanese,
    String? type,
    String? status,
    String? airedFrom,
    String? airedTo,
    String? duration,
    String? rating,
    String? synopsis,
    double? score,
    int? rank,
    int? scoredBy,
    int? episodes,
  }) {
    return AnimeModel(
      id: id ?? this.id,
      images: images ?? this.images,
      trailer: trailer ?? this.trailer,
      title: title ?? this.title,
      titleEnglish: titleEnglish ?? this.titleEnglish,
      titleJapanese: titleJapanese ?? this.titleJapanese,
      type: type ?? this.type,
      status: status ?? this.status,
      airedFrom: airedFrom ?? this.airedFrom,
      airedTo: airedTo ?? this.airedTo,
      duration: duration ?? this.duration,
      rating: rating ?? this.rating,
      synopsis: synopsis ?? this.synopsis,
      score: score ?? this.score,
      rank: rank ?? this.rank,
      scoredBy: scoredBy ?? this.scoredBy,
      episodes: episodes ?? this.episodes,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'images': images,
      'trailer': trailer,
      'title': title,
      'titleEnglish': titleEnglish,
      'titleJapanese': titleJapanese,
      'type': type,
      'status': status,
      'airedFrom': airedFrom,
      'airedTo': airedTo,
      'duration': duration,
      'rating': rating,
      'synopsis': synopsis,
      'score': score,
      'rank': rank,
      'scoredBy': scoredBy,
      'episodes': episodes,
    };
  }

  factory AnimeModel.fromMap(Map<String, dynamic> map) {
    return AnimeModel(
      id: map['mal_id'] as int,
      images: map['images']['jpg']['image_url'] as String,
      trailer: map['trailer']['youtube_id'] == null
          ? ""
          : map['trailer']['youtube_id'] as String,
      title: map['title'] as String,
      titleEnglish: map['title_english'] as String,
      titleJapanese: map['title_japanese'] as String,
      type: map['type'] as String,
      status: map['status'] as String,
      airedFrom: map['aired']['from'] as String,
      airedTo: map['aired']['to'] == null ? "" : map['aired']['to'] as String,
      duration: map['duration'] as String,
      rating: map['rating'] as String,
      synopsis: map['synopsis'] as String,
      score: map['score'] as double,
      rank: map['rank'] as int,
      scoredBy: map['scored_by'] as int,
      episodes: map['episodes'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnimeModel.fromJson(String source) =>
      AnimeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AnimeModel(id: $id, images: $images, trailer: $trailer, title: $title, titleEnglish: $titleEnglish, titleJapanese: $titleJapanese, type: $type, status: $status, airedFrom: $airedFrom, airedTo: $airedTo, duration: $duration, rating: $rating, synopsis: $synopsis, score: $score, rank: $rank, scoredBy: $scoredBy, episodes: $episodes)';
  }

  @override
  bool operator ==(covariant AnimeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.images == images &&
        other.trailer == trailer &&
        other.title == title &&
        other.titleEnglish == titleEnglish &&
        other.titleJapanese == titleJapanese &&
        other.type == type &&
        other.status == status &&
        other.airedFrom == airedFrom &&
        other.airedTo == airedTo &&
        other.duration == duration &&
        other.rating == rating &&
        other.synopsis == synopsis &&
        other.score == score &&
        other.rank == rank &&
        other.scoredBy == scoredBy &&
        other.episodes == episodes;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        images.hashCode ^
        trailer.hashCode ^
        title.hashCode ^
        titleEnglish.hashCode ^
        titleJapanese.hashCode ^
        type.hashCode ^
        status.hashCode ^
        airedFrom.hashCode ^
        airedTo.hashCode ^
        duration.hashCode ^
        rating.hashCode ^
        synopsis.hashCode ^
        score.hashCode ^
        rank.hashCode ^
        scoredBy.hashCode ^
        episodes.hashCode;
  }
}
