import 'dart:convert';
import 'package:uranus/widgets/switchBar.dart';
import 'package:uranus/models/SocketData.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

late int heartbeat;
String default_image =
    'https://rare-gallery.com/thumbnail/394707-wallpaper-error-404-anime-4k-hd.jpg';

String getSocketURL() {
  String url = 'wss://listen.moe/gateway_v2';
  if (selectedSource == MusicSource.JPOP) {
    url = 'wss://listen.moe/gateway_v2';
  } else if (selectedSource == MusicSource.KPOP) {
    url = 'wss://listen.moe/kpop/gateway_v2';
  }
  return url;
}

connect() {
  WebSocketChannel channel = IOWebSocketChannel.connect(getSocketURL());
  Stream stream = channel.stream.asBroadcastStream();
  stream.listen((event) {
    var data = jsonDecode(event);
    if (data['op'] == 0) {
      heartbeat = data['d']['heartbeat'];
    } else {
      heartbeat = 45000;
    }
    sendPings(channel, heartbeat).then((value) => {});
  });
}

Future<void> sendPings(WebSocketChannel channel, int heartbeat) async {
  await Future.delayed(Duration(milliseconds: heartbeat), () {
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
