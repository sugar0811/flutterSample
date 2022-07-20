import 'package:flutter_sample/generated/json/base/json_convert_content.dart';
import 'package:flutter_sample/generated/json/base/json_field.dart';
import 'package:flutter_sample/model/article.dart';
import 'package:flutter_sample/model/page_response_entity.dart';

class ApiResponse<T> with JsonConvert<ApiResponse<T>> {
	int? code;
	@JSONField(name: "desc")
	String? message;
	T? data;

	static const successCode = 200;

	ApiResponse();

	bool isSuccess() => code == successCode;


	ApiResponse.fromJson(Map<String,dynamic> json){
		final int? code = json['code'];
		if (code != null) {
			this.code = code;
		}
		final String? message = json['message'];
		if (message != null) {
			this.message = message;
		}
		String type = T.toString();
		T? data;
		print("type:$type");
		if(json['data'] != null){
			if(type.startsWith("PageResponseEntity<")){
				data = pagingDataFromJsonSingle<T>(json['data']);
			}else{
				data = JsonConvert.fromJsonAsT<T>(json['data']);
			}
		}
		if (data != null) {
			this.data = data;
		}
	}


	M? pagingDataFromJsonSingle<M>(Map<String, dynamic> json){
		String type = M.toString();
		String genericType = type.substring(type.indexOf("<") + 1, type.length -1);
		if((ArticleModel).toString() == genericType){
			PageResponseEntity<ArticleModel> pagingData = PageResponseEntity<ArticleModel>.fromJson(json);
			return pagingData as M;
		}

		return PageResponseEntity.fromJson(json) as M;
	}

}
