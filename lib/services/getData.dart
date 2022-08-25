import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uranus/models/SocketData.dart';
import 'package:uranus/screens/ErrorScreen.dart';
import 'package:uranus/screens/MainScreen.dart';
import 'package:web_socket_channel/io.dart';
import 'package:uranus/services/services.dart';

class GetData extends StatefulWidget {
  const GetData({Key? key}) : super(key: key);

  @override
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  MusicData? data;
  IOWebSocketChannel channel = IOWebSocketChannel.connect(getSocketURL());
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: channel.stream,
      builder: ((context, snapshot) {
        try {
          if (snapshot.hasData) {
            if (snapshot.connectionState.index == 0) {
              connect();
            }
            var d = jsonDecode(snapshot.data.toString());
            var op = d['op'];
            switch (op) {
              case 0:
                channel.sink.add(jsonEncode({"op": 9}));
                sendPings(channel, heartbeat);
                break;
              case 1:
                if (d['t'] != 'TRACK_UPDATE' &&
                    d['t'] != 'TRACK_UPDATE_REQUEST' &&
                    d['t'] != 'QUEUE_UPDATE' &&
                    d['t'] != 'NOTIFICATION') break;
                data = MusicData.fromJson(d);
                sendPings(channel, heartbeat);
                break;
              default:
                sendPings(channel, heartbeat);
                break;
            }
          }
          if (snapshot.data != null) {
            return MainScreen(URL: getImage(data!));
          }
        } catch (e) {
          return const ErrorScreen();
        }
        return const Center(
          child: Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}
