import 'package:flutter_sample/generated/json/base/json_convert_content.dart';

import 'article.dart';

class PageResponseEntity<T> with JsonConvert<T> {
	int? total;
	int? current;
	List<T>? data;
}


