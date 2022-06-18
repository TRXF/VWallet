import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';
import '../../backend/push_notifications/push_notifications_handler.dart'
    show PushNotificationsHandler;

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  VWalletFirebaseUser initialUser;
  VWalletFirebaseUser user;
  bool showSplashImage = true;
  String _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(VWalletFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? NavBarPage() : LoginPageWidget(),
          routes: [
            FFRoute(
              name: 'loginPage',
              path: 'loginPage',
              builder: (context, params) => LoginPageWidget(),
            ),
            FFRoute(
              name: 'LoadingScreen',
              path: 'loadingScreen',
              requireAuth: true,
              builder: (context, params) => LoadingScreenWidget(),
            ),
            FFRoute(
              name: 'registerAccount',
              path: 'registerAccount',
              builder: (context, params) => RegisterAccountWidget(),
            ),
            FFRoute(
              name: 'forgotPassword',
              path: 'forgotPassword',
              builder: (context, params) => ForgotPasswordWidget(),
            ),
            FFRoute(
              name: 'completeProfile',
              path: 'completeProfile',
              requireAuth: true,
              builder: (context, params) => CompleteProfileWidget(),
            ),
            FFRoute(
              name: 'onboarding',
              path: 'onboarding',
              requireAuth: true,
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'createBudgetBegin',
              path: 'createBudgetBegin',
              requireAuth: true,
              builder: (context, params) => CreateBudgetBeginWidget(),
            ),
            FFRoute(
              name: 'MY_Card',
              path: 'mYCard',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MY_Card')
                  : MYCardWidget(),
            ),
            FFRoute(
              name: 'MY_Budgets',
              path: 'mYBudgets',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MY_Budgets')
                  : MYBudgetsWidget(),
            ),
            FFRoute(
              name: 'MY_profilePage',
              path: 'mYProfilePage',
              requireAuth: true,
              builder: (context, params) => params.isEmpty
                  ? NavBarPage(initialPage: 'MY_profilePage')
                  : MYProfilePageWidget(
                      userProfile: params.getParam(
                          'userProfile', ParamType.DocumentReference, 'users'),
                    ),
            ),
            FFRoute(
              name: 'paymentDetails',
              path: 'paymentDetails',
              requireAuth: true,
              builder: (context, params) => PaymentDetailsWidget(
                transactionDetails: params.getParam('transactionDetails',
                    ParamType.DocumentReference, 'transactions'),
                userSpent: params.getParam(
                    'userSpent', ParamType.DocumentReference, 'users'),
              ),
            ),
            FFRoute(
              name: 'budgetDetails',
              path: 'budgetDetails',
              requireAuth: true,
              builder: (context, params) => BudgetDetailsWidget(
                budgetDetails: params.getParam(
                    'budgetDetails', ParamType.DocumentReference, 'budgets'),
              ),
            ),
            FFRoute(
              name: 'transferFunds',
              path: 'transferFunds',
              requireAuth: true,
              builder: (context, params) => TransferFundsWidget(),
            ),
            FFRoute(
              name: 'transferFundsVerify',
              path: 'transferFundsVerify',
              requireAuth: true,
              builder: (context, params) => TransferFundsVerifyWidget(),
            ),
            FFRoute(
              name: 'transferComplete',
              path: 'transferComplete',
              requireAuth: true,
              builder: (context, params) => TransferCompleteWidget(),
            ),
            FFRoute(
              name: 'requestFunds',
              path: 'requestFunds',
              requireAuth: true,
              builder: (context, params) => RequestFundsWidget(),
            ),
            FFRoute(
              name: 'createBudget',
              path: 'createBudget',
              requireAuth: true,
              builder: (context, params) => CreateBudgetWidget(),
            ),
            FFRoute(
              name: 'transaction_ADD',
              path: 'transactionADD',
              requireAuth: true,
              builder: (context, params) => TransactionADDWidget(),
            ),
            FFRoute(
              name: 'transaction_EDIT',
              path: 'transactionEDIT',
              requireAuth: true,
              builder: (context, params) => TransactionEDITWidget(
                transactionDetails: params.getParam('transactionDetails',
                    ParamType.DocumentReference, 'transactions'),
              ),
            ),
            FFRoute(
              name: 'changePassword',
              path: 'changePassword',
              requireAuth: true,
              builder: (context, params) => ChangePasswordWidget(),
            ),
            FFRoute(
              name: 'editProfile',
              path: 'editProfile',
              requireAuth: true,
              builder: (context, params) => EditProfileWidget(
                userProfile: params.getParam(
                    'userProfile', ParamType.DocumentReference, 'users'),
              ),
            ),
            FFRoute(
              name: 'notificationsSettings',
              path: 'notificationsSettings',
              requireAuth: true,
              builder: (context, params) => NotificationsSettingsWidget(),
            ),
            FFRoute(
              name: 'privacyPolicy',
              path: 'privacyPolicy',
              requireAuth: true,
              builder: (context, params) => PrivacyPolicyWidget(),
            ),
            FFRoute(
              name: 'tutorial_PROFILE',
              path: 'tutorialPROFILE',
              requireAuth: true,
              builder: (context, params) => TutorialPROFILEWidget(),
            ),
            FFRoute(
              name: 'homePage',
              path: 'homePage',
              requireAuth: true,
              builder: (context, params) => HomePageWidget(),
            ),
            FFRoute(
              name: 'homePage_alt',
              path: 'homePageAlt',
              requireAuth: true,
              builder: (context, params) => HomePageAltWidget(),
            ),
            FFRoute(
              name: 'homePage_alt_1',
              path: 'homePageAlt1',
              requireAuth: true,
              builder: (context, params) => HomePageAlt1Widget(),
            ),
            FFRoute(
              name: 'budget_DELETE',
              path: 'budgetDELETE',
              requireAuth: true,
              builder: (context, params) => BudgetDELETEWidget(
                budgetList: params.getParam(
                    'budgetList', ParamType.DocumentReference, 'budgets'),
              ),
            ),
            FFRoute(
              name: 'Wallet',
              path: 'wallet',
              requireAuth: true,
              builder: (context, params) => WalletWidget(),
            ),
            FFRoute(
              name: 'VerifyTx',
              path: 'verifyTx',
              requireAuth: true,
              builder: (context, params) => VerifyTxWidget(),
            ),
            FFRoute(
              name: 'WalletDetails',
              path: 'walletDetails',
              requireAuth: true,
              builder: (context, params) => WalletDetailsWidget(),
            ),
            FFRoute(
              name: 'ProcessQR',
              path: 'processQR/:type/:uuid',
              requireAuth: true,
              builder: (context, params) => ProcessQRWidget(
                type: params.getParam('type', ParamType.String),
                uuid: params.getParam('uuid', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
    );

extension NavParamExtensions on Map<String, String> {
  Map<String, String> get withoutNulls =>
      Map.fromEntries(entries.where((e) => e.value != null));
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty => state.allParams.isEmpty;
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key](param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    @required this.name,
    @required this.path,
    @required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/loginPage';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Builder(
                    builder: (context) => Image.asset(
                      'assets/images/app_screen.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : PushNotificationsHandler(child: page);

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment alignment;

  static TransitionInfo appDefault() => TransitionInfo(hasTransition: false);
}
