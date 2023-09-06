import 'dart:convert';
import 'dart:typed_data';

import '../../flutter_flow/flutter_flow_util.dart';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class SearchProductCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    String? name = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'SearchProduct',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'name': name,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class GroupwiseProductCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    String? appGroupName = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'GroupwiseProduct',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'app_group_name': appGroupName,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateOrderIdCall {
  static Future<ApiCallResponse> call({
    int? amount,
    String? currency = '',
    String? receipt = '',
    String? notes = '',
    bool? partialPayment,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateOrderId',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'amount': amount,
        'currency': currency,
        'receipt': receipt,
        'notes': notes,
        'partial_payment': partialPayment,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ProductListCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    int? id,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'ProductList',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'id': id,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CreateOrderCall {
  static Future<ApiCallResponse> call({
    String? userId = '',
    int? itemId,
    int? quantity,
    String? itemName = '',
    double? mrp,
    double? rate,
    double? defaultCd,
    double? subtotal,
    String? orderStatus = '',
    double? deliveryCharge,
    bool? isOrdered,
    String? orderTime = '',
    String? stype = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'CreateOrder',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'user_id': userId,
        'item_id': itemId,
        'quantity': quantity,
        'item_name': itemName,
        'mrp': mrp,
        'rate': rate,
        'default_cd': defaultCd,
        'subtotal': subtotal,
        'Order_status': orderStatus,
        'Delivery_charge': deliveryCharge,
        'Is_Ordered': isOrdered,
        'Order_time': orderTime,
        'stype': stype,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateOrderCall {
  static Future<ApiCallResponse> call({
    bool? isOrdered,
    String? orderTime = '',
    String? userId = '',
    String? stype = '',
    String? orderStatus = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrder',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'Is_Ordered': isOrdered,
        'Order_time': orderTime,
        'user_id': userId,
        'stype': stype,
        'Order_status': orderStatus,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateDeliveryChargeCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    double? deliveryCharge,
    String? userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateDeliveryCharge',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'Delivery_charge': deliveryCharge,
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DelivertDateCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    String? userId = '',
    String? deliveryDate = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DelivertDate',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'user_id': userId,
        'delivery_date': deliveryDate,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class AmountCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    String? userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Amount',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class UpdateOrStatusCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    String? orderStatus = '',
    String? userId = '',
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'UpdateOrStatus',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'Order_status': orderStatus,
        'user_id': userId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class DeleteOrderCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    int? itemId,
    String? userId = '',
    int? quantity,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'DeleteOrder',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'item_id': itemId,
        'user_id': userId,
        'quantity': quantity,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class SelectOrderCall {
  static Future<ApiCallResponse> call({
    String? stype = '',
    String? userId = '',
    int? itemId,
  }) {
    return ApiManager.instance.makeApiCall(
      callName: 'Select Order',
      apiUrl: 'https://grihasti.technoclay.in/api/Grihasti/?',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'stype': stype,
        'user_id': userId,
        'item_id': itemId,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
