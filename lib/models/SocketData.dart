import 'package:freezed_annotation/freezed_annotation.dart';
part 'SocketData.freezed.dart';
part 'SocketData.g.dart';

@freezed
class MusicData with _$MusicData {
  factory MusicData({
    required int op,
    required D d,
    required String t,
  }) = _MusicData;
  factory MusicData.fromJson(Map<String, Object?> json) =>
      _$MusicDataFromJson(json);
}

@freezed
class D with _$D {
  factory D({
    required Song song,
    required Map<String, dynamic>? requester,
    required String? event,
    required String? startTime,
    required List<Song> lastPlayed,
    required int listeners,
  }) = _D;
  factory D.fromJson(Map<String, Object?> json) => _$DFromJson(json);
}

@freezed
class Song with _$Song {
  factory Song({
    required int id,
    required String title,
    required List<dynamic> sources,
    required List<Artist> artists,
    required List<dynamic>? characters,
    required List<Album> albums,
    required int duration,
  }) = _Song;
  factory Song.fromJson(Map<String, Object?> json) => _$SongFromJson(json);
}

@freezed
class Album with _$Album {
  factory Album({
    required int id,
    required String? name,
    required String? nameRomaji,
    required String? image,
  }) = _Album;
  factory Album.fromJson(Map<String, Object?> json) => _$AlbumFromJson(json);
}

@freezed
class Artist with _$Artist {
  factory Artist({
    required int id,
    required String? name,
    required String? nameRomaji,
    required String? image,
    required List<dynamic>? characters,
  }) = _Artist;
  factory Artist.fromJson(Map<String, Object?> json) => _$ArtistFromJson(json);
}
