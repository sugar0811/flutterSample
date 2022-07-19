import 'package:flutter_sample/http/paging_entity.dart';
import 'package:flutter_sample/http/request.dart';
import 'package:flutter_sample/model/article.dart';
import 'package:flutter_sample/model/page_response_entity.dart';

import '../api/apis.dart';

///  @author: shuYang
///  @date: 2022/7/19
///  @description:api service

HomeService homeService = HomeService();

class HomeService {

  static const homeBaseUrl = "https://www.fastmock.site/mock/";

  final RequestClient _homeRequestClient = RequestClient(homeBaseUrl);

  Future<PageResponseEntity<ArticleModel>?> getList(PagingEntity params) async{
    return await _homeRequestClient.post<PageResponseEntity<ArticleModel>>(Apis.articleList,data: params);

  }
}
