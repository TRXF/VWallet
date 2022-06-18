import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingScreenWidget extends StatefulWidget {
  const LoadingScreenWidget({Key key}) : super(key: key);

  @override
  _LoadingScreenWidgetState createState() => _LoadingScreenWidgetState();
}

class _LoadingScreenWidgetState extends State<LoadingScreenWidget> {
  ApiCallResponse mnemonic;
  ApiCallResponse userData;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      userData = await UserCall.call(
        uid: currentUserUid,
      );
      setState(() => FFAppState().userData = getJsonField(
            (userData?.jsonBody ?? ''),
            r'''$.data''',
          ).toString());
      setState(() => FFAppState().mainAddress = getJsonField(
            (userData?.jsonBody ?? ''),
            r'''$.data.vaga_wallet''',
          ).toString());
      mnemonic = await UnlockCall.call(
        uid: currentUserUid,
        password: FFAppState().password,
      );
      setState(() => FFAppState().mnemonic = getJsonField(
            (mnemonic?.jsonBody ?? ''),
            r'''$.data''',
          ).toString());
      context.pushNamed(
        'MY_Card',
        extra: <String, dynamic>{
          kTransitionInfoKey: TransitionInfo(
            hasTransition: true,
            transitionType: PageTransitionType.rightToLeft,
          ),
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF1C1C1C),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xFF1C1C1C),
                ),
                child: Image.asset(
                  'assets/images/android-chrome-512x512.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.25,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
