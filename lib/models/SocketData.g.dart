// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SocketData.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MusicData _$$_MusicDataFromJson(Map<String, dynamic> json) => _$_MusicData(
      op: json['op'] as int,
      d: D.fromJson(json['d'] as Map<String, dynamic>),
      t: json['t'] as String,
    );

Map<String, dynamic> _$$_MusicDataToJson(_$_MusicData instance) =>
    <String, dynamic>{
      'op': instance.op,
      'd': instance.d,
      't': instance.t,
    };

_$_D _$$_DFromJson(Map<String, dynamic> json) => _$_D(
      song: Song.fromJson(json['song'] as Map<String, dynamic>),
      requester: json['requester'] as String?,
      event: json['event'] as String?,
      startTime: json['startTime'] as String?,
      lastPlayed: (json['lastPlayed'] as List<dynamic>)
          .map((e) => Song.fromJson(e as Map<String, dynamic>))
          .toList(),
      listeners: json['listeners'] as int,
    );

Map<String, dynamic> _$$_DToJson(_$_D instance) => <String, dynamic>{
      'song': instance.song,
      'requester': instance.requester,
      'event': instance.event,
      'startTime': instance.startTime,
      'lastPlayed': instance.lastPlayed,
      'listeners': instance.listeners,
    };

_$_Song _$$_SongFromJson(Map<String, dynamic> json) => _$_Song(
      id: json['id'] as int,
      title: json['title'] as String,
      sources: json['sources'] as List<dynamic>,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => Artist.fromJson(e as Map<String, dynamic>))
          .toList(),
      characters: json['characters'] as List<dynamic>,
      albums: (json['albums'] as List<dynamic>)
          .map((e) => Album.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: json['duration'] as int,
    );

Map<String, dynamic> _$$_SongToJson(_$_Song instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'sources': instance.sources,
      'artists': instance.artists,
      'characters': instance.characters,
      'albums': instance.albums,
      'duration': instance.duration,
    };

_$_Album _$$_AlbumFromJson(Map<String, dynamic> json) => _$_Album(
      id: json['id'] as int,
      name: json['name'] as String?,
      nameRomaji: json['nameRomaji'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$$_AlbumToJson(_$_Album instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameRomaji': instance.nameRomaji,
      'image': instance.image,
    };

_$_Artist _$$_ArtistFromJson(Map<String, dynamic> json) => _$_Artist(
      id: json['id'] as int,
      name: json['name'] as String?,
      nameRomaji: json['nameRomaji'] as String?,
      image: json['image'] as String?,
      characters: json['characters'] as List<dynamic>,
    );

Map<String, dynamic> _$$_ArtistToJson(_$_Artist instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameRomaji': instance.nameRomaji,
      'image': instance.image,
      'characters': instance.characters,
    };
