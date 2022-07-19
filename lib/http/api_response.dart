import 'package:flutter_sample/generated/json/base/json_convert_content.dart';

class ApiResponse<T> with JsonConvert<ApiResponse<T>> {
	int? code;
	String? message;
	T? data;

	static const successCode = 200;

	ApiResponse();

	bool isSuccess() => code == successCode;

}
