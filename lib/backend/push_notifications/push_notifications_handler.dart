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
  'registerAccount': (data) async => RegisterAccountWidget(),
  'forgotPassword': (data) async => ForgotPasswordWidget(),
  'completeProfile': (data) async => CompleteProfileWidget(),
  'onboarding': (data) async => OnboardingWidget(),
  'VAGAWalletCreated': (data) async => VAGAWalletCreatedWidget(),
  'CreateXRPLWallet': (data) async => CreateXRPLWalletWidget(
        budgetList: getParameter(data, 'budgetList'),
      ),
  'XRPLWalletCreated': (data) async => XRPLWalletCreatedWidget(),
  'CreateBSCWallet': (data) async => CreateBSCWalletWidget(
        budgetList: getParameter(data, 'budgetList'),
      ),
  'BSCWalletCreated': (data) async => BSCWalletCreatedWidget(),
  'MY_Budgets': (data) async => MYBudgetsWidget(),
  'MY_profilePage': (data) async => MYProfilePageWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
  'paymentDetails': (data) async => PaymentDetailsWidget(
        accountName: getParameter(data, 'accountName'),
        from: getParameter(data, 'from'),
        to: getParameter(data, 'to'),
        amount: getParameter(data, 'amount'),
        hash: getParameter(data, 'hash'),
        timestamp: getParameter(data, 'timestamp'),
        txhash: getParameter(data, 'txhash'),
      ),
  'transferFunds': (data) async => TransferFundsWidget(),
  'transferFundsVerify': (data) async => TransferFundsVerifyWidget(),
  'transferComplete': (data) async => TransferCompleteWidget(),
  'budgetDetails': (data) async => BudgetDetailsWidget(
        budgetDetails: getParameter(data, 'budgetDetails'),
      ),
  'notificationsSettings': (data) async => NotificationsSettingsWidget(),
  'privacyPolicy': (data) async => PrivacyPolicyWidget(),
  'editProfile': (data) async => EditProfileWidget(
        userProfile: getParameter(data, 'userProfile'),
      ),
  'requestFunds': (data) async => RequestFundsWidget(),
  'changePassword': (data) async => ChangePasswordWidget(),
  'tutorial_PROFILE': (data) async => TutorialPROFILEWidget(),
  'Wallet': (data) async => WalletWidget(),
  'NFTGallery': (data) async => NFTGalleryWidget(),
  'WalletDetails': (data) async => WalletDetailsWidget(
        address: getParameter(data, 'address'),
      ),
  'transferFundsBSC': (data) async => TransferFundsBSCWidget(),
  'transferFundsVerifyBSC': (data) async => TransferFundsVerifyBSCWidget(),
  'transferFundsXRPL': (data) async => TransferFundsXRPLWidget(),
  'transferFundsVerifyXRPL': (data) async => TransferFundsVerifyXRPLWidget(),
  'TransactionApproval': (data) async => TransactionApprovalWidget(
        type: getParameter(data, 'type'),
        uuid: getParameter(data, 'uuid'),
      ),
  'ProcessQR': (data) async => ProcessQRWidget(
        type: getParameter(data, 'type'),
      ),
  'Cooldown': (data) async => CooldownWidget(),
  'Cheater': (data) async => CheaterWidget(),
  'WalletsCards': (data) async => WalletsCardsWidget(),
  'WalletInformation': (data) async => WalletInformationWidget(),
  'SwapTokens': (data) async => SwapTokensWidget(),
  'RewardsList': (data) async => RewardsListWidget(),
  'ActivateAccount': (data) async => ActivateAccountWidget(),
  'BSCTransactionApproval': (data) async => BSCTransactionApprovalWidget(
        type: getParameter(data, 'type'),
        uuid: getParameter(data, 'uuid'),
      ),
  'BSCProcessQR': (data) async => BSCProcessQRWidget(
        type: getParameter(data, 'type'),
        gas: getParameter(data, 'gas'),
        hash: getParameter(data, 'hash'),
        owner: getParameter(data, 'owner'),
        address: getParameter(data, 'address'),
      ),
  'XRPLQRScan': (data) async => XRPLQRScanWidget(),
  'XRPLTransactionApproval': (data) async => XRPLTransactionApprovalWidget(
        type: getParameter(data, 'type'),
        uuid: getParameter(data, 'uuid'),
      ),
  'XRPLProcessQR': (data) async => XRPLProcessQRWidget(
        type: getParameter(data, 'type'),
        gas: getParameter(data, 'gas'),
        hash: getParameter(data, 'hash'),
        owner: getParameter(data, 'owner'),
        address: getParameter(data, 'address'),
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
