import 'dart:async';
import 'dart:convert';

import 'serialization_util.dart';
import '../backend.dart';
import '../../flutter_flow/flutter_flow_theme.dart';
import '../../flutter_flow/flutter_flow_util.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../index.dart';
import '../../main.dart';

class PushNotificationsHandler extends StatefulWidget {
  const PushNotificationsHandler({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  _PushNotificationsHandlerState createState() =>
      _PushNotificationsHandlerState();
}

class _PushNotificationsHandlerState extends State<PushNotificationsHandler> {
  bool _loading = false;

  Future handleOpenedPushNotification() async {
    if (isWeb) {
      return;
    }

    final notification = await FirebaseMessaging.instance.getInitialMessage();
    if (notification != null) {
      await _handlePushNotification(notification);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handlePushNotification);
  }

  Future _handlePushNotification(RemoteMessage message) async {
    setState(() => _loading = true);
    try {
      final initialPageName = message.data['initialPageName'] as String;
      final initialParameterData = getInitialParameterData(message.data);
      final pageBuilder = pageBuilderMap[initialPageName];
      if (pageBuilder != null) {
        final page = await pageBuilder(initialParameterData);
        await Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => page),
        );
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  void initState() {
    super.initState();
    handleOpenedPushNotification();
  }

  @override
  Widget build(BuildContext context) => _loading
      ? Container(
          color: Colors.transparent,
          child: Builder(
            builder: (context) => Image.asset(
              'assets/images/app_screen.png',
              fit: BoxFit.cover,
            ),
          ),
        )
      : widget.child;
}

final pageBuilderMap = <String, Future<Widget> Function(Map<String, dynamic>)>{
  'loginPage': (data) async => LoginPageWidget(),
  'LoadingScreen': (data) async => LoadingScreenWidget(),
  'registerAccount': (data) async => RegisterAccountWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'completeProfile': (data) async => CompleteProfileWidget(),
  'onboarding': (data) async => OnboardingWidget(),
  'createBudgetBegin': (data) async => CreateBudgetBeginWidget(),
  'MY_Budgets': (data) async => NavBarPage(initialPage: 'MY_Budgets'),
  'MY_profilePage': (data) async => hasMatchingParameters(data, {'userProfile'})
      ? MYProfilePageWidget(
          userProfile: getParameter(data, 'userProfile'),
        )
      : NavBarPage(initialPage: 'MY_profilePage'),
  'paymentDetails': (data) async => PaymentDetailsWidget(
        transactionDetails: getParameter(data, 'transactionDetails'),
        userSpent: getParameter(data, 'userSpent'),
      ),
  'budgetDetails': (data) async => BudgetDetailsWidget(
        budgetDetails: getParameter(data, 'budgetDetails'),
      ),
  'transferFunds': (data) async => TransferFundsWidget(),
  'transferFundsVerify': (data) async => TransferFundsVerifyWidget(),
  'transferComplete': (data) async => TransferCompleteWidget(),
  'requestFunds': (data) async => RequestFundsWidget(),
  'createBudget': (data) async => CreateBudgetWidget(),
  'transaction_ADD': (data) async => TransactionADDWidget(),
  'transaction_EDIT': (data) async => TransactionEDITWidget(
        transactionDetails: getParameter(data, 'transactionDetails'),
      ),
  'changePassword': (data) async => ChangePasswordWidget(),
  'editProfile': (data) async => EditProfileWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
  'notificationsSettings': (data) async => NotificationsSettingsWidget(),
  'privacyPolicy': (data) async => PrivacyPolicyWidget(),
  'tutorial_PROFILE': (data) async => TutorialPROFILEWidget(),
  'homePage': (data) async => HomePageWidget(),
  'homePage_alt': (data) async => HomePageAltWidget(),
  'homePage_alt_1': (data) async => HomePageAlt1Widget(),
  'budget_DELETE': (data) async => BudgetDELETEWidget(
        budgetList: getParameter(data, 'budgetList'),
      ),
  'Wallet': (data) async => WalletWidget(),
  'VerifyTx': (data) async => VerifyTxWidget(),
  'WalletDetails': (data) async => WalletDetailsWidget(),
  'ProcessQR': (data) async => ProcessQRWidget(
        type: getParameter(data, 'type'),
        uuid: getParameter(data, 'uuid'),
      ),
};

bool hasMatchingParameters(Map<String, dynamic> data, Set<String> params) =>
    params.any((param) => getParameter(data, param) != null);

Map<String, dynamic> getInitialParameterData(Map<String, dynamic> data) {
  try {
    final parameterDataStr = data['parameterData'];
    if (parameterDataStr == null ||
        parameterDataStr is! String ||
        parameterDataStr.isEmpty) {
      return {};
    }
    return jsonDecode(parameterDataStr) as Map<String, dynamic>;
  } catch (e) {
    print('Error parsing parameter data: $e');
    return {};
  }
}
