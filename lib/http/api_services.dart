import 'package:flutter_sample/http/paging_entity.dart';
import 'package:flutter_sample/http/request.dart';
import 'package:flutter_sample/model/article.dart';
import 'package:flutter_sample/model/page_response_entity.dart';

import '../api/apis.dart';
import 'error.dart';
import 'iservice.dart';

///  @author: shuYang
///  @date: 2022/7/19
///  @description:api service

HomeService homeService = HomeService();

class HomeService extends IApiService{

  final RequestClient _homeRequestClient = RequestClient(Hosts.homeBaseUrl);

  @override
  RequestClient getClient()  => _homeRequestClient;


  Future<PageResponseEntity<ArticleModel>?> getArticleList(
      PagingEntity params) async {
    return await _homeRequestClient
        .post<PageResponseEntity<ArticleModel>>(HomeApis.articleList,data: params);
  }


}
