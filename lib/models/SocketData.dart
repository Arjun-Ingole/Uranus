import 'dart:convert';

MusicData musicDataFromJson(String str) => MusicData.fromJson(json.decode(str));
String musicDataToJson(MusicData data) => json.encode(data.toJson());

class MusicData {
  MusicData({
    required this.op,
    required this.d,
    required this.t,
  });
  late final int op;
  late final D d;
  late final String t;

  MusicData.fromJson(Map<String, dynamic> json) {
    op = json['op'];
    d = D.fromJson(json['d']);
    t = json['t'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['op'] = op;
    _data['d'] = d.toJson();
    _data['t'] = t;
    return _data;
  }
}

class D {
  D({
    required this.song,
    this.requester,
    this.event,
    required this.startTime,
    required this.lastPlayed,
    required this.listeners,
  });
  late final Song song;
  late final Null requester;
  late final Null event;
  late final String startTime;
  late final List<LastPlayed> lastPlayed;
  late final int listeners;

  D.fromJson(Map<String, dynamic> json) {
    song = Song.fromJson(json['song']);
    requester = null;
    event = null;
    startTime = json['startTime'];
    lastPlayed = List.from(json['lastPlayed'])
        .map((e) => LastPlayed.fromJson(e))
        .toList();
    listeners = json['listeners'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['song'] = song.toJson();
    _data['requester'] = requester;
    _data['event'] = event;
    _data['startTime'] = startTime;
    _data['lastPlayed'] = lastPlayed.map((e) => e.toJson()).toList();
    _data['listeners'] = listeners;
    return _data;
  }
}

class Song {
  Song({
    required this.id,
    required this.title,
    required this.sources,
    required this.artists,
    required this.albums,
    required this.duration,
    required this.favorite,
  });
  late final int id;
  late final String title;
  late final List<dynamic> sources;
  late final List<Artists> artists;
  late final List<dynamic> albums;
  late final int duration;
  late final bool favorite;

  Song.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sources = List.castFrom<dynamic, dynamic>(json['sources']);
    artists =
        List.from(json['artists']).map((e) => Artists.fromJson(e)).toList();
    albums = List.castFrom<dynamic, dynamic>(json['albums']);
    duration = json['duration'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['sources'] = sources;
    _data['artists'] = artists.map((e) => e.toJson()).toList();
    _data['albums'] = albums;
    _data['duration'] = duration;
    _data['favorite'] = favorite;
    return _data;
  }
}

class Artists {
  Artists({
    required this.id,
    required this.name,
    this.nameRomaji,
    required this.image,
  });
  late final int id;
  late final String name;
  late final Null nameRomaji;
  late final String image;

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameRomaji = null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nameRomaji'] = nameRomaji;
    _data['image'] = image;
    return _data;
  }
}

class LastPlayed {
  LastPlayed({
    required this.id,
    required this.title,
    required this.sources,
    required this.artists,
    required this.albums,
    required this.duration,
    required this.favorite,
  });
  late final int id;
  late final String title;
  late final List<dynamic> sources;
  late final List<Artists> artists;
  late final List<Albums> albums;
  late final int duration;
  late final bool favorite;

  LastPlayed.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    sources = List.castFrom<dynamic, dynamic>(json['sources']);
    artists =
        List.from(json['artists']).map((e) => Artists.fromJson(e)).toList();
    albums = List.from(json['albums']).map((e) => Albums.fromJson(e)).toList();
    duration = json['duration'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['sources'] = sources;
    _data['artists'] = artists.map((e) => e.toJson()).toList();
    _data['albums'] = albums.map((e) => e.toJson()).toList();
    _data['duration'] = duration;
    _data['favorite'] = favorite;
    return _data;
  }
}

class Albums {
  Albums({
    required this.id,
    required this.name,
    this.nameRomaji,
    this.image,
  });
  late final int id;
  late final String name;
  late final Null nameRomaji;
  late final Null image;

  Albums.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    nameRomaji = null;
    image = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['nameRomaji'] = nameRomaji;
    _data['image'] = image;
    return _data;
  }
}
