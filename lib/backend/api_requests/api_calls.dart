import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

class UserCall {
  static Future<ApiCallResponse> call({
    String uid = '0',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'User',
      apiUrl: 'https://vagabonds.cloud/api/user/user',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
      },
      returnBody: true,
    );
  }

  static dynamic vagawallet(dynamic response) => getJsonField(
        response,
        r'''$['data']['vaga_wallet']''',
      );
  static dynamic bscwallet(dynamic response) => getJsonField(
        response,
        r'''$['data']['bsc_wallet']''',
      );
  static dynamic xrplwallet(dynamic response) => getJsonField(
        response,
        r'''$['data']['xrpl_wallet']''',
      );
}

class BalanceCall {
  static Future<ApiCallResponse> call({
    String uid = 'Kbhv7sXhrARmXj26zWF2kJesxO82',
  }) {
    final body = '''
{
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Balance',
      apiUrl: 'https://vagabonds.cloud/api/app/balance',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class TransactionsCall {
  static Future<ApiCallResponse> call({
    String address = '',
  }) {
    final body = '''
{
  "address": "${address}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Transactions',
      apiUrl: 'https://vagabonds.cloud/api/app/tx',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'address': address,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic from(dynamic response) => getJsonField(
        response,
        r'''$['data'][:25]['body']['messages'][0].from_address''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data[:25].body.messages[0].amount[0]''',
      );
  static dynamic to(dynamic response) => getJsonField(
        response,
        r'''$['data'][:25]['body']['messages'][0].to_address''',
      );
  static dynamic get(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class CreateWalletCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Create Wallet',
      apiUrl: 'https://vagabonds.cloud/api/app/create?uid=${uid}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic mnemonic(dynamic response) => getJsonField(
        response,
        r'''$.data.wallet.mnemonic''',
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  static dynamic privatekey(dynamic response) => getJsonField(
        response,
        r'''$.data.wallet.privateKey''',
      );
}

class IncomeCall {
  static Future<ApiCallResponse> call({
    String address = '',
  }) {
    final body = '''
{"address":"${address}" }''';
    return ApiManager.instance.makeApiCall(
      callName: 'Income',
      apiUrl: 'https://vagabonds.cloud/api/app/income',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'address': address,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class SpendingCall {
  static Future<ApiCallResponse> call({
    String address = '',
  }) {
    final body = '''
{"address":"${address}" }''';
    return ApiManager.instance.makeApiCall(
      callName: 'Spending',
      apiUrl: 'https://vagabonds.cloud/api/app/spending',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'address': address,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class TransferCall {
  static Future<ApiCallResponse> call({
    String address = '',
    String amount = '',
    String mnemonic = '',
  }) {
    final body = '''
{
  "address": "${address}",
  "amount": "${amount}",
  "mnemonic": "${mnemonic}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Transfer',
      apiUrl: 'https://vagabonds.cloud/api/app/transfer',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'address': address,
        'amount': amount,
        'mnemonic': mnemonic,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class GasCall {
  static Future<ApiCallResponse> call({
    String address = '',
    String amount = '',
    String mnemonic = '',
  }) {
    final body = '''
{
  "address": "${address}",
  "amount": "${amount}",
  "mnemonic": "${mnemonic}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Gas',
      apiUrl: 'https://vagabonds.cloud/api/app/gas',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'address': address,
        'amount': amount,
        'mnemonic': mnemonic,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}
