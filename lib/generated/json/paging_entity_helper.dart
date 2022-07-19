import 'package:flutter_sample/http/paging_entity.dart';

pagingEntityFromJson(PagingEntity data, Map<String, dynamic> json) {
	if (json['current'] != null) {
		data.current = json['current'] is String
				? int.tryParse(json['current'])
				: json['current'].toInt();
	}
	if (json['order'] != null) {
		data.order = json['order'].toString();
	}
	if (json['size'] != null) {
		data.size = json['size'] is String
				? int.tryParse(json['size'])
				: json['size'].toInt();
	}
	if (json['sort'] != null) {
		data.sort = json['sort'].toString();
	}
	return data;
}

Map<String, dynamic> pagingEntityToJson(PagingEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['current'] = entity.current;
	data['order'] = entity.order;
	data['size'] = entity.size;
	data['sort'] = entity.sort;
	return data;
}