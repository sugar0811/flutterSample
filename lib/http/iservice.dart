import 'package:flutter_sample/http/request.dart';

import 'error.dart';

///  @author: shuYang
///  @date: 2022/7/20
///  @description:

abstract class IApiService{

  RequestClient getClient();

  Future<T?> request<T>(String url,
      {String method = "GET",
        Map<String, dynamic>? queryParameters,
        data,
        Map<String, dynamic>? headers,
        bool Function(ApiException)? onError}) async {

    return await getClient().request<T>(url,
        method: method,
        queryParameters: queryParameters,
        data: data,
        headers: headers,
        onError: onError);
  }

}
