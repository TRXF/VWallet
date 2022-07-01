// Automatic FlutterFlow imports
import '../../backend/backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '../../flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
import 'package:socket_io_client/socket_io_client.dart' as IO;

Future socketIoQR(
  String uuid,
  String hash,
) async {
  IO.Socket socket = IO.io('https://wss.vagabonds.cloud');
  socket.onConnect((_) {
    print('connection');
    socket.emit('send_message', {hash, uuid});
  });
}
