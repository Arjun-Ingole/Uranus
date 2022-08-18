import 'dart:convert';
import 'package:uranus/widgets/switchBar.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

late int heartbeat;

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
