import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_sample/http/error.dart';
import 'package:flutter_sample/generated/json/base/json_convert_content.dart';
import 'package:flutter_sample/http/api_response.dart';
import 'package:flutter_sample/model/name.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../generated/json/api_response_helper.dart';

void request(Function() block,
    {bool isShowLoading = false,
    String loadingMsg = "加载中...",
    bool Function(ApiException)? onError}) async {
  if (isShowLoading) {
    EasyLoading.show(status: loadingMsg);
  }
  try {
    await block.call();
  } catch (e) {
    var apiException = ApiException.from(e);
    onError?.call(apiException);
  } finally {
    EasyLoading.dismiss();
  }
}

class RequestClient {
  late Dio _dio;

  RequestClient(String baseUrl) {
    _dio = Dio(BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: 15000));
    _dio.interceptors.add(PrettyDioLogger(
        requestHeader: true, requestBody: true, responseHeader: true));
  }

  Future<T?> request<T>(String url,
      {String method = "GET",
      Map<String, dynamic>? queryParameters,
      data,
      Map<String, dynamic>? headers,
      bool Function(ApiException)? onError}) async {
    Options options = Options()
      ..method = method
      ..headers = headers;

    try {
      data = _convertData(data);
      Response response = await _dio.request(url,
          options: options, data: data, queryParameters: queryParameters);
      return _handleResponse<T>(response);
    } catch (e) {
      var apiException = ApiException.from(e);

      /// 如果发生异常，由onError处理
      onError?.call(apiException);
    }
    return null;
  }

  /// 处理http请求响应
  T? _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      ApiResponse<T> apiResponse = ApiResponse<T>().fromJson(response.data);
      return _handleBusinessResponse<T>(apiResponse);
    } else {
      /// 未知的http错误 直接抛出
      var e = ApiException(response.statusCode, ApiException.unknownException);
      throw e;
    }
  }

  /// 处理业务数据响应
  T? _handleBusinessResponse<T>(ApiResponse<T> apiResponse) {
    if (apiResponse.isSuccess()) {
      return apiResponse.data;
    } else {
      /// 业务错误 直接抛出
      var e = ApiException(apiResponse.code, apiResponse.message);
      throw e;
    }
  }

  _convertData(data) {
    if (data != null) {
      data = jsonDecode(jsonEncode(data));
    }
    return data;
  }

  Future<T?> get<T>(String url,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers,
      bool isShowLoading = false,
      bool Function(ApiException)? onError}) {
    return request(url,
        queryParameters: queryParameters, headers: headers, onError: onError);
  }

  Future<T?> post<T>(String url,
      {Map<String, dynamic>? queryParameters,
      data,
      Map<String, dynamic>? headers,
      bool Function(ApiException)? onError}) {
    return  request(url,
        method: "POST",
        data: data,
        queryParameters: queryParameters,
        headers: headers,
        onError: onError);
  }
  Future<T?> put<T>(String url,
      {Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool Function(ApiException)? onError}) {
    return request(url,
        method: "POST",
        data: data,
        queryParameters: queryParameters,
        headers: headers,
        onError: onError);
  }


}
