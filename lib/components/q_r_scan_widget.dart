import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class QRScanWidget extends StatefulWidget {
  const QRScanWidget({Key key}) : super(key: key);

  @override
  _QRScanWidgetState createState() => _QRScanWidgetState();
}

class _QRScanWidgetState extends State<QRScanWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
            color: Color(0xFF1C1C1C),
          ),
        ),
      ],
    );
  }
}
