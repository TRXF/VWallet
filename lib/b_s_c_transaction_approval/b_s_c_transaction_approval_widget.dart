import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class BSCTransactionApprovalWidget extends StatefulWidget {
  const BSCTransactionApprovalWidget({
    Key key,
    this.type,
    this.uuid,
  }) : super(key: key);

  final String type;
  final String uuid;

  @override
  _BSCTransactionApprovalWidgetState createState() =>
      _BSCTransactionApprovalWidgetState();
}

class _BSCTransactionApprovalWidgetState
    extends State<BSCTransactionApprovalWidget> with TickerProviderStateMixin {
  ApiCallResponse approved;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final animationsMap = {
    'textOnPageLoadAnimation': AnimationInfo(
      trigger: AnimationTrigger.onPageLoad,
      duration: 600,
      delay: -220,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        scale: 0.4,
        opacity: 0,
      ),
      finalState: AnimationState(
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      if (!((widget.type != null && widget.type != ''))) {
        context.pushNamed('MY_Card');
      }
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ApiCallResponse>(
      future: ConvertHexCall.call(
        txblob: widget.type,
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
        final bSCTransactionApprovalConvertHexResponse = snapshot.data;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryColor,
          body: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Visibility(
              visible: responsiveVisibility(
                context: context,
                tablet: false,
                tabletLandscape: false,
                desktop: false,
              ),
              child: FutureBuilder<ApiCallResponse>(
                future: UnlockbscCall.call(
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
                  final columnUnlockbscResponse = snapshot.data;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                          ),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.8,
                          constraints: BoxConstraints(
                            maxHeight:
                                MediaQuery.of(context).size.height * 0.84,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).darkBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(16),
                              bottomRight: Radius.circular(16),
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 44, 20, 20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 0, 0),
                                            child: Text(
                                              'Review Transaction',
                                              textAlign: TextAlign.start,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title1,
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    50, 0, 0, 0),
                                            child: Card(
                                              clipBehavior:
                                                  Clip.antiAliasWithSaveLayer,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .background,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: FlutterFlowIconButton(
                                                borderColor: Colors.transparent,
                                                borderRadius: 30,
                                                buttonSize: 48,
                                                icon: Icon(
                                                  Icons.close_rounded,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .textColor,
                                                  size: 30,
                                                ),
                                                onPressed: () async {
                                                  context.pop();
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 50, 0, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              ConvertHexCall.type(
                                                (bSCTransactionApprovalConvertHexResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ).toString().maybeHandleOverflow(
                                                    maxChars: 28,
                                                    replacement: '…',
                                                  ),
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle1
                                                  .override(
                                                    fontFamily: 'Lexend Deca',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .textColor,
                                                    fontSize: 16,
                                                  ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            10, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'for ',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 4, 0, 0),
                                              child: Text(
                                                getJsonField(
                                                  (bSCTransactionApprovalConvertHexResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                  r'''$.data.wsid''',
                                                )
                                                    .toString()
                                                    .maybeHandleOverflow(
                                                      maxChars: 28,
                                                      replacement: '…',
                                                    ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .bodyText1
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .textColor,
                                                      fontSize: 14,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          if ((ConvertHexCall.amount(
                                                (bSCTransactionApprovalConvertHexResponse
                                                        ?.jsonBody ??
                                                    ''),
                                              ) !=
                                              null))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 15, 0, 45),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  ConvertHexCall.amount(
                                                    (bSCTransactionApprovalConvertHexResponse
                                                            ?.jsonBody ??
                                                        ''),
                                                  ).toString(),
                                                  '0',
                                                ),
                                                textAlign: TextAlign.end,
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .subtitle2
                                                    .override(
                                                      fontFamily: 'Lexend Deca',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .tertiaryColor,
                                                      fontSize: 24,
                                                    ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: FFButtonWidget(
                          onPressed: () async {
                            var _shouldSetState = false;
                            approved = await SignhashbscCall.call(
                              txblob: widget.type,
                              mnemonic: getJsonField(
                                (columnUnlockbscResponse?.jsonBody ?? ''),
                                r'''$.data''',
                              ).toString(),
                            );
                            _shouldSetState = true;
                            if ((getJsonField(
                                  (approved?.jsonBody ?? ''),
                                  r'''$.data''',
                                ) !=
                                null)) {
                              await ApproveWssCall.call(
                                uuid: getJsonField(
                                  (bSCTransactionApprovalConvertHexResponse
                                          ?.jsonBody ??
                                      ''),
                                  r'''$.data.uuid''',
                                ).toString(),
                                txhash: getJsonField(
                                  (approved?.jsonBody ?? ''),
                                  r'''$.data.deployTransaction.hash''',
                                ).toString(),
                                address: getJsonField(
                                  (approved?.jsonBody ?? ''),
                                  r'''$.data.address''',
                                ).toString(),
                              );
                              context.pushNamed(
                                'BSCProcessQR',
                                queryParams: {
                                  'type': serializeParam(
                                      getJsonField(
                                        (approved?.jsonBody ?? ''),
                                        r'''$.data.deployTransaction.hash''',
                                      ).toString(),
                                      ParamType.String),
                                  'gas': serializeParam(
                                      getJsonField(
                                        (approved?.jsonBody ?? ''),
                                        r'''$.data.deployTransaction.gasLimit.hex''',
                                      ).toString(),
                                      ParamType.String),
                                  'owner': serializeParam(
                                      getJsonField(
                                        (approved?.jsonBody ?? ''),
                                        r'''$.data.signer.address''',
                                      ).toString(),
                                      ParamType.String),
                                  'address': serializeParam(
                                      getJsonField(
                                        (approved?.jsonBody ?? ''),
                                        r'''$.data.address''',
                                      ).toString(),
                                      ParamType.String),
                                }.withoutNulls,
                              );
                            } else {
                              context.pushNamed('ActivateAccount');
                              if (_shouldSetState) setState(() {});
                              return;
                            }

                            if (_shouldSetState) setState(() {});
                          },
                          text: 'Approve',
                          options: FFButtonOptions(
                            width: 300,
                            height: 70,
                            color: FlutterFlowTheme.of(context).primaryColor,
                            textStyle:
                                FlutterFlowTheme.of(context).subtitle2.override(
                                      fontFamily: 'Lexend Deca',
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                        child: Text(
                          'Tap above to complete this transaction',
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
                                    fontFamily: 'Lexend Deca',
                                    color: Color(0x43000000),
                                  ),
                        ).animated([animationsMap['textOnPageLoadAnimation']]),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}
