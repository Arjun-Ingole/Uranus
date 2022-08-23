import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:uranus/models/SocketData.dart';
import 'package:uranus/screens/ErrorScreen.dart';
import 'package:uranus/screens/MainScreen.dart';
import 'package:web_socket_channel/io.dart';
import 'package:uranus/services/services.dart';

class GetData extends StatefulWidget {
  GetData({Key? key}) : super(key: key);

  @override
  IOWebSocketChannel channel = IOWebSocketChannel.connect(getSocketURL());
  State<GetData> createState() => _GetDataState();
}

class _GetDataState extends State<GetData> {
  @override
  MusicData? data;
  Widget build(BuildContext context) {
    return StreamBuilder<dynamic>(
      stream: widget.channel.stream,
      builder: ((context, snapshot) {
        try {
          if (snapshot.hasData) {
            if (snapshot.connectionState.index == 0) {
              connect();
            }
            var d = jsonDecode(snapshot.data);
            var op = d['op'];
            switch (op) {
              case 0:
                break;
              case 1:
                if (d['t'] != 'TRACK_UPDATE' &&
                    d['t'] != 'TRACK_UPDATE_REQUEST' &&
                    d['t'] != 'QUEUE_UPDATE' &&
                    d['t'] != 'NOTIFICATION') break;
                data = MusicData.fromJson(d);
                break;
              case 9:
                sendPings(widget.channel, heartbeat).then((value) => {});
                break;
              default:
            }
          }
          if (snapshot.data != null) {
            print(getImage(data!));
            return MainScreen(URL: getImage(data!));
          }
        } catch (e) {
          print(e);
          print(data);
          return ErrorScreen();
        }
        return Center(
          child: Center(child: CircularProgressIndicator()),
        );
      }),
    );
  }
}
