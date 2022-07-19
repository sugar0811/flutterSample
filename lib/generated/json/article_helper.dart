import 'package:flutter_sample/model/article.dart';

articleModelFromJson(ArticleModel data, Map<String, dynamic> json) {
	if (json['title'] != null) {
		data.title = json['title'].toString();
	}
	if (json['author'] != null) {
		data.author = json['author'].toString();
	}
	if (json['cover'] != null) {
		data.cover = json['cover'].toString();
	}
	if (json['des'] != null) {
		data.des = json['des'].toString();
	}
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['url'] != null) {
		data.url = json['url'].toString();
	}
	return data;
}

Map<String, dynamic> articleModelToJson(ArticleModel entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['title'] = entity.title;
	data['author'] = entity.author;
	data['cover'] = entity.cover;
	data['des'] = entity.des;
	data['createTime'] = entity.createTime;
	data['url'] = entity.url;
	return data;
}