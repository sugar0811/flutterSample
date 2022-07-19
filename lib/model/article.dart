import '../generated/json/base/json_convert_content.dart';

class ArticleModel with JsonConvert<ArticleModel> {
	String? title;
	String? author;
	String? cover;
	String? des;
	String? createTime;
	String? url;
}