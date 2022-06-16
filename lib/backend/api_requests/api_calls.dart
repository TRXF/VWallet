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
}

class BalanceCall {
  static Future<ApiCallResponse> call({
    String address = 'vaga1aa9amkzmsy6ldneg06yapper5n6kysagac3efx',
  }) {
    final body = '''
{
  "address": "${address}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Balance',
      apiUrl: 'https://vagabonds.cloud/api/vchain/balance',
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

  static dynamic balance(dynamic response) => getJsonField(
        response,
        r'''$['data']['balances'][0]['amount']''',
      );
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
      apiUrl: 'https://vagabonds.cloud/api/vchain/transactions',
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

  static dynamic txs(dynamic response) => getJsonField(
        response,
        r'''$['data']['txs']''',
      );
  static dynamic signatures(dynamic response) => getJsonField(
        response,
        r'''$['data']['tx_responses'][:25]''',
      );
}
