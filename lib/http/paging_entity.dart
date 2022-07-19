import 'package:flutter_sample/generated/json/base/json_convert_content.dart';

class PagingEntity with JsonConvert<PagingEntity> {
	int? current;
	String? order;
	int? size;
	String? sort;

	PagingEntity();

}
