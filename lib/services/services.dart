import 'dart:convert';
import 'package:uranus/widgets/switchBar.dart';
import 'package:uranus/models/SocketData.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

int heartbeat = 45000;
late IOWebSocketChannel channel = getChannel();
String default_image =
    'https://media.wired.com/photos/5f87340d114b38fa1f8339f9/master/w_1600,c_limit/Ideas_Surprised_Pikachu_HD.jpg';

String getSocketURL() {
  late String url;
  if (selectedSource == MusicSource.JPOP) {
    url = 'wss://listen.moe/gateway_v2';
  } else if (selectedSource == MusicSource.KPOP) {
    url = 'wss://listen.moe/kpop/gateway_v2';
  }
  return url;
}

connect() {
  Stream stream = channel.stream.asBroadcastStream();
  stream.listen((event) {
    var data = jsonDecode(event);
    if (data['op'] == 0) {
      heartbeat = data['d']['heartbeat'];
    }
    sendPings(channel, heartbeat);
  });
}

sendPings(WebSocketChannel channel, int heartbeat) {
  Future.delayed(Duration(milliseconds: heartbeat), () {
    try {
      channel.sink.add(jsonEncode({"op": 9}));
    } catch (e) {
      connect();
    }
  });
}

String getImage(MusicData data) {
  String image = default_image;
  final List<Album> album_list = data.d.song.albums;
  try {
    for (int i = 0; i < album_list.length; i++) {
      if (album_list[i].image != null) {
        image = "https://cdn.listen.moe/covers/" + album_list[i].image!;
      }
    }
  } catch (e) {
    image = default_image;
  }
  return image;
}

String getTitle(MusicData data) {
  String song_title = "Unknown";
  try {
    song_title = data.d.song.title;
  } catch (e) {
    return song_title;
  }
  return song_title;
}

String getArtist(MusicData data) {
  String artist_name = "Unknown";
  final List<Artist> artist_list = data.d.song.artists;
  try {
    for (int i = 0; i < artist_list.length; i++) {
      if (artist_list[i].name != null) {
        artist_name = artist_list[i].name!;
      } else if (artist_list[i].nameRomaji != null) {
        artist_name = artist_list[i].nameRomaji!;
      }
      break;
    }
  } catch (e) {
    return artist_name;
  }
  return artist_name;
}

IOWebSocketChannel getChannel() {
  IOWebSocketChannel channel = IOWebSocketChannel.connect(getSocketURL());
  return channel;
}
