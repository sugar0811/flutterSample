import 'package:flutter_sample/generated/json/base/json_convert_content.dart';

import 'article.dart';

class PageResponseEntity<T> with JsonConvert<T> {
	int? total;
	int? current;
	List<T>? data;

	PageResponseEntity();


	PageResponseEntity.fromJson(Map<String,dynamic> json){
		if (json['total'] != null) {
			total = json['total'] is String
					? int.tryParse(json['total'])
					: json['total'].toInt();
		}
		if (json['current'] != null) {
			current = json['current'] is String
					? int.tryParse(json['current'])
					: json['current'].toInt();
		}
		if (json['data'] != null) {
			data = (json['data'] as List).map((v) => JsonConvert.fromJsonAsT<T>(v)).toList();
		}
	}

}


