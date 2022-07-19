import 'package:flutter_sample/generated/json/base/json_convert_content.dart';
import 'package:flutter_sample/model/page_response_entity.dart';

pageResponseEntityFromJson(PageResponseEntity data, Map<String, dynamic> json) {
	if (json['total'] != null) {
		data.total = json['total'] is String
				? int.tryParse(json['total'])
				: json['total'].toInt();
	}
	if (json['current'] != null) {
		data.current = json['current'] is String
				? int.tryParse(json['current'])
				: json['current'].toInt();
	}
	if (json['data'] != null) {
		data.data = (json['data'] as List).map((v) => v.fromJson(v)).toList();
	}
	return data;
}

Map<String, dynamic> pageResponseEntityToJson(PageResponseEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['total'] = entity.total;
	data['current'] = entity.current;
	data['data'] =  entity.data?.map((v) => v.toJson())?.toList();
	return data;
}