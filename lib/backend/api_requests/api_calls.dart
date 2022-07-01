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
  static dynamic metamask(dynamic response) => getJsonField(
        response,
        r'''$['data']['metamask']''',
      );
  static dynamic xumm(dynamic response) => getJsonField(
        response,
        r'''$['data']['xumm']''',
      );
  static dynamic api(dynamic response) => getJsonField(
        response,
        r'''$.data.api''',
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

  static dynamic vaga(dynamic response) => getJsonField(
        response,
        r'''$.data.vaga''',
      );
  static dynamic bsc(dynamic response) => getJsonField(
        response,
        r'''$.data.bsc''',
      );
  static dynamic xrpl(dynamic response) => getJsonField(
        response,
        r'''$.data.xrpl''',
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
        r'''$.data[:].from''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data[:].amount''',
      );
  static dynamic to(dynamic response) => getJsonField(
        response,
        r'''$.data[:].to''',
      );
  static dynamic get(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static dynamic timestamp(dynamic response) => getJsonField(
        response,
        r'''$.data[:].timestamp''',
      );
  static dynamic txhash(dynamic response) => getJsonField(
        response,
        r'''$.data[:].txhash''',
      );
  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[:].data''',
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
        r'''$.data.mnemonic''',
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  static dynamic privatekey(dynamic response) => getJsonField(
        response,
        r'''$.data.privateKey''',
      );
  static dynamic mnemonicRaw(dynamic response) => getJsonField(
        response,
        r'''$.data.mnemonicRaw''',
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

  static dynamic txhash(dynamic response) => getJsonField(
        response,
        r'''$.data.transactionHash''',
      );
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

class UnlockCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String password = '',
  }) {
    final body = '''
{
  "uid": "${uid}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Unlock',
      apiUrl: 'https://vagabonds.cloud/api/app/unlock',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'uid': uid,
        'password': password,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic mnemonic(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class SignhashCall {
  static Future<ApiCallResponse> call({
    String txblob = '',
    String mnemonic = '',
  }) {
    final body = '''
{
"txblob": "${txblob}",
"mnemonic": "${mnemonic}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signhash',
      apiUrl: 'https://vagabonds.cloud/api/app/sign',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'txblob': txblob,
        'mnemonic': mnemonic,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic txhash(dynamic response) => getJsonField(
        response,
        r'''$.data.transactionHash''',
      );
  static dynamic gasUsed(dynamic response) => getJsonField(
        response,
        r'''$.data.gasUsed''',
      );
  static dynamic log(dynamic response) => getJsonField(
        response,
        r'''$.data.rawLog''',
      );
  static dynamic code(dynamic response) => getJsonField(
        response,
        r'''$.data.code''',
      );
}

class TxHashCall {
  static Future<ApiCallResponse> call({
    String hash = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'txHash',
      apiUrl: 'https://vaga.network/cosmos/tx/v1beta1/txs/${hash}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic messages(dynamic response) => getJsonField(
        response,
        r'''$.tx.body.messages[0]''',
      );
  static dynamic authinfo(dynamic response) => getJsonField(
        response,
        r'''$.tx.auth_info''',
      );
  static dynamic memo(dynamic response) => getJsonField(
        response,
        r'''$.tx.body.memo''',
      );
  static dynamic txresponse(dynamic response) => getJsonField(
        response,
        r'''$.tx_response''',
      );
}

class ConvertHexCall {
  static Future<ApiCallResponse> call({
    String txblob = '',
    String uid = '',
  }) {
    final body = '''
{
  "txblob": "${txblob}",
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ConvertHex',
      apiUrl: 'https://vagabonds.cloud/api/app/converthex',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'txblob': txblob,
        'uid': uid,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic type(dynamic response) => getJsonField(
        response,
        r'''$.data.type''',
      );
  static dynamic amount(dynamic response) => getJsonField(
        response,
        r'''$.data.amount''',
      );
  static dynamic to(dynamic response) => getJsonField(
        response,
        r'''$.data.to''',
      );
}

class CalculateRewardsCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'CalculateRewards',
      apiUrl: 'https://vagabonds.cloud/api/app/calculateRewards',
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

class RewardsBalanceCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
  "uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RewardsBalance',
      apiUrl: 'https://vagabonds.cloud/api/app/rewardBalance',
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

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class TakeSnapshotCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String address = '',
  }) {
    final body = '''
{
  "uid": "${uid}",
  "address": "${address}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'TakeSnapshot',
      apiUrl: 'https://vagabonds.cloud/api/app/takeSnap',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'uid': uid,
        'address': address,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class HealthCheckCall {
  static Future<ApiCallResponse> call() {
    return ApiManager.instance.makeApiCall(
      callName: 'HealthCheck',
      apiUrl: 'https://vagabonds.cloud/api/ping',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic pong(dynamic response) => getJsonField(
        response,
        r'''$.pong''',
      );
}

class CheckAddressCall {
  static Future<ApiCallResponse> call({
    String badderss = '',
    String xaddress = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CheckAddress',
      apiUrl:
          'https://vagabonds.cloud/api/app/checkAddress?baddress=${badderss}&xaddress=${xaddress}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class SwapToeknCall {
  static Future<ApiCallResponse> call({
    String amount = '',
    String balance = '',
    String address = '',
    String uid = '',
    String token = '',
  }) {
    final body = '''
{
  "amount": "${amount}",
  "balance": "${balance}",
  "address": "${address}",
  "uid": "${uid}",
  "token": "${token}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'swapToekn',
      apiUrl: 'https://vagabonds.cloud/api/app/swapTokens',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'amount': amount,
        'balance': balance,
        'address': address,
        'uid': uid,
        'token': token,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UserNFTsCall {
  static Future<ApiCallResponse> call({
    String address = '',
  }) {
    final body = '''
{
  "address": "${address}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UserNFTs',
      apiUrl: 'https://vagabonds.cloud/api/app/usersNFTs',
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

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
  static dynamic itemList(dynamic response) => getJsonField(
        response,
        r'''$.data[:].NftItem''',
      );
}

class RegisterUserCall {
  static Future<ApiCallResponse> call({
    String uid = '',
    String email = '',
  }) {
    final body = '''
{
  "uid": "${uid}",
  "email": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'RegisterUser',
      apiUrl: 'https://vagabonds.cloud/api/app/register',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'uid': uid,
        'email': email,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class CreateBSCWalletCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateBSCWallet',
      apiUrl:
          'https://vagabonds.cloud/api/app/onboarding/createbscwallet?uid=${uid}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }
}

class CreateXRPLWalletCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateXRPLWallet ',
      apiUrl:
          'https://vagabonds.cloud/api/app/onboarding/createxrplwallet?uid=${uid}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data''',
      );
}

class UnlockxrplCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
"uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'unlockxrpl',
      apiUrl: 'https://vagabonds.cloud/api/app/unlockxrpl',
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

class ApproveWssCall {
  static Future<ApiCallResponse> call({
    String uuid = '',
    String txhash = '',
  }) {
    final body = '''
{
  "uuid": "${uuid}",
  "txhash": "${txhash}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'ApproveWss',
      apiUrl: 'https://vagabonds.cloud/api/app/wss/approve',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'uuid': uuid,
        'txhash': txhash,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }
}

class UnlockbscCall {
  static Future<ApiCallResponse> call({
    String uid = '',
  }) {
    final body = '''
{
"uid": "${uid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'unlockbsc',
      apiUrl: 'https://vagabonds.cloud/api/app/unlockbsc',
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

class SignhashbscCall {
  static Future<ApiCallResponse> call({
    String txblob = '',
    String mnemonic = '',
  }) {
    final body = '''
{
"txblob": "${txblob}",
"mnemonic": "${mnemonic}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'signhashbsc',
      apiUrl: 'https://vagabonds.cloud/api/app/signbsc',
      callType: ApiCallType.POST,
      headers: {},
      params: {
        'txblob': txblob,
        'mnemonic': mnemonic,
      },
      body: body,
      bodyType: BodyType.JSON,
      returnBody: true,
    );
  }

  static dynamic signer(dynamic response) => getJsonField(
        response,
        r'''$.data.signer.address''',
      );
  static dynamic address(dynamic response) => getJsonField(
        response,
        r'''$.data.address''',
      );
  static dynamic hash(dynamic response) => getJsonField(
        response,
        r'''$.data.deployTransaction.hash''',
      );
  static dynamic gas(dynamic response) => getJsonField(
        response,
        r'''$.data.deployTransaction.gasLimit.hex''',
      );
}
