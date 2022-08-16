import 'dart:convert';

MusicData musicDataFromJson(String str) => MusicData.fromJson(json.decode(str));
String musicDataToJson(MusicData data) => json.encode(data.toJson());

class MusicData {
  MusicData({
    this.op,
    this.d,
    this.t,
  });

  int? op;
  D? d;
  String? t;

  factory MusicData.fromJson(Map<String, dynamic> json) => MusicData(
        op: json["op"],
        d: D.fromJson(json["d"]),
        t: json["t"],
      );

  Map<String, dynamic> toJson() => {
        "op": op,
        "d": d?.toJson(),
        "t": t,
      };
}

class D {
  D({
    this.song,
    this.requester,
    this.event,
    this.startTime,
    this.lastPlayed,
    this.listeners,
  });

  Song? song;
  dynamic? requester;
  dynamic? event;
  DateTime? startTime;
  List<Song>? lastPlayed;
  int? listeners;

  factory D.fromJson(Map<String, dynamic> json) => D(
        song: Song.fromJson(json["song"]),
        requester: json["requester"],
        event: json["event"],
        startTime: DateTime.parse(json["startTime"]),
        lastPlayed:
            List<Song>.from(json["lastPlayed"].map((x) => Song.fromJson(x))),
        listeners: json["listeners"],
      );

  Map<String, dynamic> toJson() => {
        "song": song?.toJson(),
        "requester": requester,
        "event": event,
        "startTime": startTime?.toIso8601String(),
        "lastPlayed": List<dynamic>.from(lastPlayed!.map((x) => x.toJson())),
        "listeners": listeners,
      };
}

class Song {
  Song({
    this.id,
    this.title,
    this.sources,
    this.artists,
    this.albums,
    this.duration,
    this.favorite,
  });

  int? id;
  String? title;
  List<dynamic>? sources;
  List<Album>? artists;
  List<Album>? albums;
  int? duration;
  bool? favorite;

  factory Song.fromJson(Map<String, dynamic> json) => Song(
        id: json["id"],
        title: json["title"],
        sources: List<dynamic>.from(json["sources"].map((x) => x)),
        artists:
            List<Album>.from(json["artists"].map((x) => Album.fromJson(x))),
        albums: List<Album>.from(json["albums"].map((x) => Album.fromJson(x))),
        duration: json["duration"],
        favorite: json["favorite"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sources": List<dynamic>.from(sources!.map((x) => x)),
        "artists": List<dynamic>.from(artists!.map((x) => x.toJson())),
        "albums": List<dynamic>.from(albums!.map((x) => x.toJson())),
        "duration": duration,
        "favorite": favorite,
      };
}

class Album {
  Album({
    this.id,
    this.name,
    this.nameRomaji,
    this.image,
  });

  int? id;
  String? name;
  String? nameRomaji;
  String? image;

  factory Album.fromJson(Map<String, dynamic> json) => Album(
        id: json["id"],
        name: json["name"],
        nameRomaji: json["nameRomaji"] == null ? null : json["nameRomaji"],
        image: json["image"] == null ? null : json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "nameRomaji": nameRomaji == null ? null : nameRomaji,
        "image": image == null ? null : image,
      };
}
