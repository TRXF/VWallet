import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialMediaFeedWidget extends StatefulWidget {
  const SocialMediaFeedWidget({
    Key key,
    this.userProfile,
  }) : super(key: key);

  final DocumentReference userProfile;

  @override
  _SocialMediaFeedWidgetState createState() => _SocialMediaFeedWidgetState();
}

class _SocialMediaFeedWidgetState extends State<SocialMediaFeedWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
