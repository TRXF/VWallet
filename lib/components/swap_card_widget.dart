import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class SwapCardWidget extends StatefulWidget {
  const SwapCardWidget({
    Key key,
    this.address,
  }) : super(key: key);

  final String address;

  @override
  _SwapCardWidgetState createState() => _SwapCardWidgetState();
}

class _SwapCardWidgetState extends State<SwapCardWidget> {
  ApiCallResponse checkedAddress;
  ApiCallResponse cooldown;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: UserCall.call(
        uid: currentUserUid,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: SpinKitRipple(
                color: Color(0xFFDA0004),
                size: 40,
              ),
            ),
          );
        }
        final containerUserResponse = snapshot.data;
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).darkBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(24, 24, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Rewards',
                      style: FlutterFlowTheme.of(context).title1,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: RewardsBalanceCall.call(
                      uid: currentUserUid,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: SpinKitRipple(
                              color: Color(0xFFDA0004),
                              size: 40,
                            ),
                          ),
                        );
                      }
                      final rowRewardsBalanceResponse = snapshot.data;
                      return InkWell(
                        onTap: () async {
                          context.pushNamed('RewardsList');
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Balance:',
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed('RewardsList');
                                },
                                child: Text(
                                  getJsonField(
                                    (rowRewardsBalanceResponse?.jsonBody ?? ''),
                                    r'''$.data''',
                                  ).toString(),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: FutureBuilder<ApiCallResponse>(
                    future: CalculateRewardsCall.call(
                      uid: currentUserUid,
                    ),
                    builder: (context, snapshot) {
                      // Customize what your widget looks like when it's loading.
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: SpinKitRipple(
                              color: Color(0xFFDA0004),
                              size: 40,
                            ),
                          ),
                        );
                      }
                      final rowCalculateRewardsResponse = snapshot.data;
                      return Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Snap:',
                            style: FlutterFlowTheme.of(context).bodyText1,
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                            child: InkWell(
                              onTap: () async {
                                context.pushNamed('RewardsList');
                              },
                              child: Text(
                                valueOrDefault<String>(
                                  getJsonField(
                                    (rowCalculateRewardsResponse?.jsonBody ??
                                        ''),
                                    r'''$.data''',
                                  ).toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context).bodyText1,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 25, 0, 44),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FFButtonWidget(
                        onPressed: () async {
                          checkedAddress = await CheckAddressCall.call(
                            badderss: UserCall.bscwallet(
                              (containerUserResponse?.jsonBody ?? ''),
                            ).toString(),
                            xaddress: UserCall.bscwallet(
                              (containerUserResponse?.jsonBody ?? ''),
                            ).toString(),
                          );
                          if ((getJsonField(
                                (checkedAddress?.jsonBody ?? ''),
                                r'''$.data''',
                              ) !=
                              null)) {
                            context.pushNamed('SwapTokens');
                          } else {
                            context.pushNamed('Cheater');
                          }

                          setState(() {});
                        },
                        text: 'Swap',
                        options: FFButtonOptions(
                          width: 150,
                          height: 50,
                          color: FlutterFlowTheme.of(context).background,
                          textStyle: FlutterFlowTheme.of(context).bodyText2,
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 8,
                        ),
                      ),
                      FFButtonWidget(
                        onPressed: () async {
                          cooldown = await TakeSnapshotCall.call(
                            uid: currentUserUid,
                            address: UserCall.vagawallet(
                              (containerUserResponse?.jsonBody ?? ''),
                            ).toString(),
                          );
                          if (!((getJsonField(
                                (cooldown?.jsonBody ?? ''),
                                r'''$.data''',
                              ) !=
                              null))) {
                            context.pushNamed(
                              'Cooldown',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType: PageTransitionType.scale,
                                  alignment: Alignment.bottomCenter,
                                ),
                              },
                            );
                          }
                          Navigator.pop(context);

                          setState(() {});
                        },
                        text: 'Snap',
                        options: FFButtonOptions(
                          width: 150,
                          height: 50,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
