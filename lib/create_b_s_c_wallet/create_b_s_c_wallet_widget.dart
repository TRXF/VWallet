import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateBSCWalletWidget extends StatefulWidget {
  const CreateBSCWalletWidget({
    Key key,
    this.budgetList,
  }) : super(key: key);

  final DocumentReference budgetList;

  @override
  _CreateBSCWalletWidgetState createState() => _CreateBSCWalletWidgetState();
}

class _CreateBSCWalletWidgetState extends State<CreateBSCWalletWidget> {
  ApiCallResponse data;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: Column(
        mainAxisSize: MainAxisSize.max,
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
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).darkBackground,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(20, 44, 20, 20),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                      child: Image.asset(
                        'assets/images/bsc_wallet_image.png',
                        width: MediaQuery.of(context).size.width,
                        height: 300,
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
                      child: Text(
                        'VGO Wallet',
                        style: FlutterFlowTheme.of(context).title1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(20, 12, 20, 0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              'Create your VGO Wallet on the Binance Smart Chain.',
                              textAlign: TextAlign.center,
                              style: FlutterFlowTheme.of(context).bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 10),
                      child: StreamBuilder<UsersRecord>(
                        stream: UsersRecord.getDocument(currentUserReference),
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
                          final buttonUsersRecord = snapshot.data;
                          return FFButtonWidget(
                            onPressed: () async {
                              data = await CreateBSCWalletCall.call(
                                uid: currentUserUid,
                              );
                              setState(() =>
                                  FFAppState().bscmnemoniclist = (getJsonField(
                                    (data?.jsonBody ?? ''),
                                    r'''$.data.mnemonicRaw''',
                                  ) as List)
                                      .map<String>((s) => s.toString())
                                      .toList());
                              setState(() =>
                                  FFAppState().bscPrivateKey = getJsonField(
                                    (data?.jsonBody ?? ''),
                                    r'''$.data.privateKeyRaw''',
                                  ).toString());

                              final usersUpdateData = createUsersRecordData(
                                bscWallet: getJsonField(
                                  (data?.jsonBody ?? ''),
                                  r'''$.data.address''',
                                ).toString(),
                              );
                              await buttonUsersRecord.reference
                                  .update(usersUpdateData);
                              context.pushNamed('BSCWalletCreated');

                              setState(() {});
                            },
                            text: 'Create Wallet',
                            options: FFButtonOptions(
                              width: 300,
                              height: 70,
                              color:
                                  FlutterFlowTheme.of(context).darkBackground,
                              textStyle: FlutterFlowTheme.of(context).title1,
                              elevation: 0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: 12,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Text(
            'Tap above to create your VGO Wallet',
            style: FlutterFlowTheme.of(context).bodyText1.override(
                  fontFamily: 'Lexend Deca',
                  color: FlutterFlowTheme.of(context).lineColor,
                ),
          ),
        ],
      ),
    );
  }
}
